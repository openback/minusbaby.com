<?php
class NewsController extends AppController {
    public $name = 'News';
    public $uses = array('Post');
    public $helpers = array('Time', 'Text');
    public $components = array(
        'Attachment' => array(
            'files_dir' => 'news',
            'rm_tmp_file' => false,
            'allow_non_image_files' => false,
			'max_file_size' => 3145728, /* in bytes */
            'images_size' => array(
				'large' => array(720, null, null)
            )
        ),
    );

    function index() {
        $this->set('posts', $this->Post->find('all', array('limit' => 5)));
        $this->set('postsList', $this->Post->find('navList'));
    }

    function view($id = null) {
        $post = $this->Post->findById($id);

		if (empty($post))
			throw new NotFoundException('Could not find that post');

		if (!$this->request->is('ajax')) {
			$this->set('postsList', $this->Post->find('navList'));
		}
		$this->set('posts', array($post));
		$this->render('index');
    }

    function preview() {
		/*
		// TODO: make this work
        $this->autoRender = false;
        $response = array('success' => false);

        if (empty($this->request->data)) {
            $response['data'] = array('Error' => 'Empty data');
            $response['code'] = -1;
        } else {
            $this->Post->create($this->request->data);

            if ($this->Post->validates(array('ignore_image' => true))) {
                $this->set('post', $this->request->data);
                $this->render('preview');
                return;
            } else {
                $response['data'] = $this->Post->validationErrors;
                $response['code'] = 0;
            }
        }

        $this->header('Content-Type: application/json');
        echo json_encode($response);
		*/
    }

    function add() {
        if (empty($this->request->data))
			return;

		$this->Pixelpod->redirectIfCancel();

		if (!empty($this->request->data['Post']['post']['name'])) {
			if (! $this->Attachment->upload($this->request->data['Post'])) {
				$this->Session->setFlash('There was a problem saving the image.', 'flash_failure');
				return;
			}
		}

		if ($this->Post->save($this->request->data)) {
			$this->Session->setFlash('Your post was successfully created.', 'flash_success');
			$this->redirect(array('action' => 'view', $this->Post->id, $this->Post->field('slug')));
		} else {
			$this->Session->setFlash('There Post could not be created.', 'flash_failure');
        }
    }

    function edit($id = null) {
		if ($this->request->is('ajax')) {
			return $this->Pixelpod->handleAjaxEdit('Post', $id);
		}

		$this->Post->id = $id;
        if (!$this->Post->exists())
            throw new NotFoundException();

		if (empty($this->request->data)) {
			$this->request->data = $this->Post->read();
			return;
		}

		$this->Pixelpod->redirectIfCancel(array('action' => 'view', $id, $this->Post->field('slug')));

		$this->log(1);
		$this->log($this->request->data);

		if (!empty($this->request->data['Post']['delete_image'])) {
			// need to delete the image, so make sure we grab the original
			$originalPost = $this->Post->findById($id);

			if (!empty($originalPost['Post']['post_file_path'])) {
				$this->Attachment->delete_files($originalPost['Post']['post_file_path']);
				$this->Session->setFlash('Image deleted succesfully.', 'flash_success');
			}

			// Remove the image from the new data
			$this->request->data['Post']['post_file_path'] = null;
			$this->request->data['Post']['post_file_name'] = null;
			$this->request->data['Post']['post_file_size'] = null;
			$this->request->data['Post']['content_type'] = null;
		} elseif (!empty($this->request->data['Post']['post']['name'])) {
			if (!$this->Attachment->upload($this->request->data['Post'])) {
				$this->Session->setFlash("There was an error saving the image: {$this->Post->validationErrors['post_file_name']}",'flash_failure');
				return;
			}
		}

		$this->log(2);
		$this->log($this->request->data);

		if ($this->Post->save($this->request->data)) {
			$this->Session->setFlash('The post was updated successfully.','flash_success');
			$this->redirect(array('action' => 'view', $id, $this->Post->field('slug')));
		} else {
			$this->Session->setFlash('There was a problem updating the post.','flash_failure');
		}
    }

    function delete($id) {
        $post = $this->Post->findById($id);
        $filename = $post['Post']['post_file_path'];

        if ($this->Post->delete($id)) {
            $this->Attachment->delete_files($filename);
            $this->Session->setFlash('The post was successfully deleted', 'flash_success');
            $this->redirect(array('action' => 'index'));
        } else {
            $this->Session->setFlash('There was a problem deleting the post.', 'flash_failure');
        }
    }

    function beforeFilter() {
        // grab our session before calling Auth
        if ($this->action == 'preview') {
            if (isset($this->params['pass'][0])) {
                $this->Session->id($this->params['pass'][0]);
                $this->Session->start();
            }
        }

        parent::beforeFilter();

		$this->Security->unlockedActions = array('index');
        $this->Auth->deny('preview');
        $this->set('controller_name','news');
    }
}
?>
