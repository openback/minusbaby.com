<?php
App::uses('AppController', 'Controller');
/**
 * Videos Controller
 *
 * @property Video $Video
 */
class VideosController extends AppController {
    public $name = 'Video';
    public $uses = array('Video');
    public $helpers = array('Time', 'Text');

	public function index() {
		$video = $this->Video->find('first');
		if (!empty($video)) {
			$this->redirect(array('action' => 'view', $video['Video']['id'], $video['Video']['slug']));
		}
	}

    function view($id = null, $slug = null) {
		$this->Video->id = $id;
		if (!$this->Video->exists()) {
			throw new NotFoundException(__('Sorry, we could not find that video.'));
		}
		$video = $this->Video->read(null, $id);
		if ($slug != $video['Video']['slug']) {
			$this->redirect(array('action' => 'view', $video['Video']['id'], $video['Video']['slug']));
		}
		$this->set('video', $video);
		$this->set('title_for_layout', $video['Video']['title']);
    }

	function sort() {
		if ($this->request->is('post') && $this->request->is('ajax')) {
			$ids = explode(',', $this->request->data['Video']['ids']);
			$data = array();

			foreach($ids as $idx => $id) {
				$data[] = array('id' => $id, 'sort_order' => $idx);
			}

			if ($this->Video->saveMany($data)) {
				return $this->Pixelpod->sendJSON(true);
			} else {
				return $this->Pixelpod->sendJSON(false, $this->Video->validationErrors);
			}
		}

		$this->set('title_for_layout', 'Sort Videos');
	}

	/**
	 * add method
	 *
	 * @return void
	 */
	public function add() {
		if ($this->request->is('post')) {
			$this->Pixelpod->redirectIfCancel();

            $this->request->data['Video']['sort_order']  = $this->Video->find('count') + 1;
			$this->Video->create();
			if ($this->Video->save($this->request->data)) {
				$this->Session->setFlash(__('The video has been saved'));
				$this->redirect(array('action' => 'index'));
			} else {
				$this->Session->setFlash(__('The video could not be saved. Please, try again.'), 'error');
			}
		}
	}

	/**
	 * edit method
	 *
	 * @param string $id
	 * @return void
	 */
	public function edit($id = null) {
		$this->Video->id = $id;
		if (!$this->Video->exists()) {
			throw new NotFoundException(__('Invalid video'));
		}
		if ($this->request->is('post') || $this->request->is('put')) {
			$this->Pixelpod->redirectIfCancel(array('action' => 'view', $id));

			if ($this->Video->save($this->request->data)) {
				$this->Session->setFlash(__('The video has been saved'));
				$this->redirect(array('action' => 'view', $id , $this->Video->field('slug')));
			} else {
				$this->Session->setFlash(__('The video could not be saved. Please, try again.'));
			}
		} else {
			$this->request->data = $this->Video->read(null, $id);
		}
	}

	/**
	 * delete method
	 *
	 * @param string $id
	 * @return void
	 */
	public function delete($id = null) {
		// TODO: confirm deletion
		/*
		if (!$this->request->is('post')) {
			throw new MethodNotAllowedException();
		}
		 */
		$this->Video->id = $id;
		if (!$this->Video->exists()) {
			throw new NotFoundException(__('Invalid video'));
		}
		if ($this->Video->delete()) {
			$this->redirect(array('action' => 'index'));
		}
	}

    public function reorder() {
        if (!$this->request->is('ajax')) {
            $this->Session->setFlash('That is not allowed.', 'error');
            $this->redirect('/');
        }

        $this->autoRender = false;

        $videos = array();

        foreach ($this->request->data['elements'] as $idx => $videoId) {
            $videos[] = array('id' => $videoId, 'sort_order' => $idx + 1);
        }

        $this->Video->saveMany($videos, array('validate' => false));
    }



    function beforeFilter() {
        parent::beforeFilter();

        $this->Auth->deny('reorder');

        $this->set('controller_name','videos');

		if (!$this->request->is('ajax')) {
			$this->set('videos', $this->Video->find('all', array(
				'fields' => array(
					'Video.id',
					'Video.sort_order',
					'Video.url',
					'Video.thumbnail_url',
					'Video.title',
					'Video.slug'
				)
			)));
		}
    }
}
