<?php
class MusicController extends AppController {
    public $uses = array('Album', 'Song');
    public $helpers = array('Time', 'CountryList');
    private $fullAttachmentConfig = array(
		'files_dir' => 'album-covers',
		'rename_files' => true,
		'rm_tmp_file' => false,
		'allow_non_image_files' => false,
		'max_file_size' => 3145728, /* in bytes */
		'images_size' => array(
			'large' => array(460, null, null),
			'thumb' => array(230, 246, 'resizeCrop')
		)
    );
    private $thumbAttachmentConfig = array(
		'files_dir' => 'album-covers',
		'rename_files' => true,
		'rm_tmp_file' => false,
		'allow_non_image_files' => false,
		'max_file_size' => 3145728, /* in bytes */
		'images_size' => array(
			'thumb' => array(230, 246, 'resizeCrop')
		)
    );

    function index() {
		$this->set('page_class', 'albums');
        $this->_setAlbums();
    }

    function view($id = null) {
		$album = $this->Album->findById($id);

        if (empty($album)) {
            throw new NotFoundException();
        }

		$this->set('page_class', 'album');
		$this->set('album', $album);
    }

    function edit($id = null) {
		$album = $this->Album->findById($id);
        if (empty($album)) {
            throw new NotFoundException();
        }

		if (empty($this->request->data)) {
			$this->request->data = $this->Album->findById($id);
			return;
		}

		$this->Pixelpod->redirectIfCancel(array('action' => 'view', $id, $album['Album']['slug']));

		$this->removeEmptySongs();

		if (! $this->_saveFiles())
			return;

		unset($this->Album->Song->validate['album_id']);

		if ($this->Album->saveAll($this->request->data, array('validate' => 'first'))) {
			$slug = $this->Album->field('slug');
			$this->Session->setFlash('The album was updated succesfully.', 'flash_success');
			$this->redirect(array('action' => 'view', $id, $slug));
		} else {
			$this->Session->setFlash('There was a problem updating the album.', 'flash_failure');
		}
    }

    function add() {
        if (!empty($this->request->data)) {
			$this->removeEmptySongs();
            $this->Album->create();

            if ($this->_saveFiles()) {
				unset($this->Album->Song->validate['album_id']);

				// And now we can save it
				if ($this->Album->saveAll($this->request->data, array('validate' => 'first'))) {
					$this->Session->setFlash('The album was created succesfully.', 'flash_success');
					$this->redirect(array('action' => 'index'));
				} else {
					$this->Session->setFlash('There was a problem creating the album.', 'flash_failure');
				}
			}
        }

        $this->render('edit');
    }

    function delete($id) {
        if ($this->Album->delete($id)) {
            $this->Session->setFlash('The album was deleted succesfully.', 'flash_success');
        } else {
            $this->Session->setFlash('There was a problem deleting the album.', 'flash_failure');
        }

        $this->redirect(array('action' => 'index'));
    }

    function autocomplete($field) {
        $this->Autocomplete->find($field);
    }

    function _setAlbums() {
        $this->set('eps', $this->Album->find('ep'));
        $this->set('lps', $this->Album->find('lp'));
        $this->set('compilations',$this->Album->find('compilation'));
        $this->set('appears_on',$this->Album->find('appearsOn'));
    }

    function _saveFiles() {
		// Get ready for large files
		ini_set('memory_limit', '1030M');
		ini_set('upload_max_filesize', '100M');
		ini_set('post_max_size', '1024M');
		ini_set('max_file_uploads', '30');
		ini_set('max_input_time', 3600);
		ini_set('max_execution_time', 3600);
		ini_set('session.gc_maxexecution_timefetime', 3600);
        $songs_to_delete = array();

        if (isset($this->request->data['Album']['delete_cover'])) {
			$this->Attachment = $this->Components->load('Attachment', $this->fullAttachmentConfig);
            $this->Attachment->delete_files($this->request->data['Album']['cover_file_path']);

            $this->request->data['Album']['cover_file_path'] = null;
            $this->request->data['Album']['cover_file_name'] = null;
            $this->request->data['Album']['cover_file_size'] = null;
            $this->request->data['Album']['cover_content_type'] = null;
			$this->Components->unload('Attachment');

			$this->Attachment = $this->Components->load('Attachment', $this->thumbAttachmentConfig);
            $this->Attachment->delete_files($this->request->data['Album']['thumbnail_file_path']);
            $this->request->data['Album']['thumbnail_file_path'] = null;
            $this->request->data['Album']['thumbnail_file_name'] = null;
            $this->request->data['Album']['thumbnail_file_size'] = null;
            $this->request->data['Album']['thumbnail_content_type'] = null;
        } else {
            if (!empty($this->request->data['Album']['cover']['name'])) {
				$this->Attachment = $this->Components->load('Attachment', $this->fullAttachmentConfig);

                if(!$this->Attachment->upload($this->request->data['Album'],'cover')) {
                    $this->Session->setFlash('There was a problem saving the cover.', 'flash_failure');
                    return false;
                }

				$this->Components->unload('Attachment');
            }

            if (!empty($this->request->data['Album']['thumbnail']['name'])) {
				$this->Attachment = $this->Components->load('Attachment', $this->thumbAttachmentConfig);

                if (!$this->Attachment->upload($this->request->data['Album'], 'thumbnail')) {
                    $this->Session->setFlash('There was a problem saving the thumbnail.', 'flash_failure');
                    return false;
                }

				$this->Components->unload('Attachment');
            }
        }

        if (isset($this->request->data['Song'])) {
            $mp3_dir = WWW_ROOT.'attachments'.DS.'mp3';

            // Save the mp3s manually
            foreach ($this->request->data['Song'] as $idx => &$song) {
                if (isset($song['delete']) && $song['delete']) {
                    if (!$this->Album->Song->delete($song['id'])) {
                        $this->Session->setFlash('The Song could not be deleted from disk.', 'flash_failure');
                    } else {
						unset($this->request->data['Song'][$idx]);
                    }

                    continue;
                }

                if (!empty($song['song']['name'])) {
                    if ($song['song']['error'] === UPLOAD_ERR_OK) {
                        if (!is_uploaded_file($song['song']['tmp_name'])) {
                            $this->Session->setFlash('Error uploading file.', 'flash_failure');
                            return false;
                        }

                        // make sure the directory exists
                        if (!is_dir($mp3_dir))
                            mkdir($mp3_dir, 0755, true);

                        if (!copy($song['song']['tmp_name'], $mp3_dir.DS.$song['song']['name'])) {
                            $this->Session->setFlash('There was an error copying the file.', 'flash_failure');
                            return false;
                        }

                        $song['url'] = $song['song']['name'];
                        $song['file_size'] = $song['song']['size'];

                        unset($song['song']);
                    } else {
                        $this->Session->setFlash('There was a problem saving '.$song['song']['name'].' (Error: '.$song['song']['error'].')', 'flash_failure');
                        return false;
                    }
                }

                // Populate fields if needed
                if (is_file($mp3_dir.DS.$song['url'])) {
					App::import('vendor', 'getid3', array('file' =>'getid3/getid3/getid3.php'));

                    $getID3 = new getID3;
                    $fileInfo = $getID3->analyze($mp3_dir.DS.$song['url']);

                    if (empty($song['title']) && !empty($fileInfo['tags']['id3v2']['title']))
                        $song['title'] = utf8_encode($fileInfo['tags']['id3v2']['title'][0]);

                    if (empty($song['artist'])) {
                        if (is_array($fileInfo['tags']['id3v2']['artist'])) {
                            $song['artist'] = utf8_encode($fileInfo['tags']['id3v2']['artist'][0]);
                        } else {
                            $song['artist'] = utf8_encode($fileInfo['tags']['id3v2']['artist']);
                        }
                    }

                    if (empty($song['number']) && isset($fileInfo['tags']['id3v2']['track_number']))
						$song['number'] = $fileInfo['tags']['id3v2']['track_number'][0];

                    $song['length'] = $fileInfo['playtime_string'];
                }
            }

            if (empty($this->request->data['Song']))
                unset($this->request->data['Song']);
        }

        return true;
    }

	private function removeEmptySongs() {
		// Go through and remove any completely empty songs
		if (!array_key_exists('Song', $this->request->data)) {
			return;
		}

		foreach ($this->request->data['Song'] as $id => $song) {
			// Then check all of the actual fields
			$this->Song->create($song);
			if ($this->Song->isEmpty(array('song.name'), array('album_id', 'downloads', 'delete', 'song'))) {
				unset($this->request->data['Song'][$id]);
			}
		}

		if (empty($this->request->data['Song'])) {
			unset($this->request->data['Song']);
		}
	}

    function beforeFilter() {
        parent::beforeFilter();
		$this->Security->unlockedActions = array('add', 'edit');
        $this->set('controller_name','music');
    }
}
?>
