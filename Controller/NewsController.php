<?php
class NewsController extends AppController {
    public $name = 'News';
    public $uses = array('Post');
    public $helpers = array('Time', 'Text');
    public $components = array(
        'Attachment' => array(
            'files_dir' => 'news',
            'rm_tmp_file' => true,
            'allow_non_image_files' => false,
            'images_size' => array(
                'original' => true,
            )
        ),
    );
    public $paginate = array(
        'limit' => 5,
        'order' => array(
            'Post.date' => 'desc',
        ),
    );

    function index() {
        $this->set('posts', $this->paginate('Post'));
        $this->set('postsList', $this->Post->find('all', array('fields' => array('id', 'title', 'slug', 'date'))));

        if ($this->request->is('ajax')) {
            $this->layout = null;
            $this->render('/elements/paginated_posts');
        }
    }

    function view($id = null) {
        $post = $this->Post->findById($id);

		if (empty($post))
			throw new NotFoundException('Could not find that post');

		$this->set('posts', array($post));
        $this->set('postsList', $this->Post->find('all', array('fields' => array('id', 'title', 'slug', 'date'))));
		$this->render('index');
    }

    function preview() {
        $this->autoRender = false;
        $response = array('success' => false);

		// TODO: respond properly
        if (empty($this->data)) {
            $response['data'] = array('Error' => 'Empty data');
            $response['code'] = -1;
        } else {
            $this->Post->create($this->data);

            if ($this->Post->validates(array('ignore_image' => true))) {
                $this->set('post', $this->data);
                $this->render('preview');
                return;
            } else {
                $response['data'] = $this->Post->validationErrors;
                $response['code'] = 0;
            }
        }

        $this->header('Content-Type: application/json');
        echo json_encode($response);
    }

    function add() {
        if (empty($this->data))
			return;

		$this->Pixelpod->redirectIfCancel();

		if (!empty($this->data['Post']['post']['name'])) {
			if (! $this->Attachment->upload($this->data['Post'])) {
				$this->Session->setFlash('There was a problem saving the image.', 'flash_failure');
				return;
			}
		}

		if ($this->Post->save($this->data)) {
			$this->Session->setFlash('Your post was successfully created.', 'flash_success');
			$this->redirect(array('action' => 'view', $this->Post->id, $this->Post->field('slug')));
		} else {
			$this->Session->setFlash('There Post could not be created.', 'flash_failure');
        }
    }

    function edit($id = null) {
		$this->Post->id = $id;
        if (!$this->Post->exists())
            throw new NotFoundException();

		if (empty($this->data)) {
			$this->data = $this->Post->read();
			return;
		}

		$this->Pixelpod->redirectIfCancel(array('action' => 'view', $id, $this->Post->field('slug')));

		if (!empty($this->data['Post']['delete_image'])) {
			// need to delete the image, so make sure we grab the original
			$originalPost = $this->Post->findById($id);

			if (!empty($originalPost['Post']['post_file_path'])) {
				$this->Attachment->delete_files($originalPost['Post']['post_file_path']);
				$this->Session->setFlash('Image deleted succesfully.', 'flash_success');
			}

			// Remove the image from the new data
			$this->data['Post']['post_file_path'] = null;
			$this->data['Post']['post_file_name'] = null;
			$this->data['Post']['post_file_size'] = null;
			$this->data['Post']['content_type'] = null;

		} elseif (!empty($this->data['Post']['post']['name'])) {
			if (!$this->Attachment->upload($this->data['Post'])) {
				$this->Session->setFlash('There was an error saving the image.','flash_failure');
				return;
			}
		}

		if ($this->Post->save($this->data)) {
			$this->Session->setFlash('The post was updated successfully.','flash_success');
			$this->redirect(array('action' => 'view', $id, $this->Post->field('slug')));
		} else {
			$this->Session->setFlash('There was a problem updating the post.','flash_failure');
		}
    }

    function delete($id) {
        $post = $this->Post->findbyId($id);
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
        $this->Auth->deny('preview');
        $this->set('controller_name','news');
    }
}
?>
