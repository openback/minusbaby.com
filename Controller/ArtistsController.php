<?php
App::uses('AppController', 'Controller');
/**
 * Fields Controller
 *
 * @property Field $Field
 * @property AjaxComponent $Ajax
 */
class ArtistsController extends AppController {
/**
 * index method
 *
 * @return void
 */
	public function index() {
		if ($this->request->is('post')) {
			$this->Pixelpod->redirectIfCancel(array('controller' => 'about'));

			$deleteSuccessful = true;
			$toDelete = array();
			$artists = array();

			foreach($this->request->data['Artist'] as $artist) {
				$this->Artist->create($artist);

				if ($this->Artist->isEmpty(null, array('hidden', 'sort_order', 'show_in_contact')))
					continue;

				if (array_key_exists('delete', $artist) && $artist['delete']) {
					if (!$this->Artist->delete()) {
						$deleteSuccessful = false;
						// it didn't delete, so leave it in our data array
						$artists[] = $artist;
					}
				} else {
					$artists[] = $artist;
				}
			}

			$this->request->data['Artist'] = $artists;

			if (!$deleteSuccessful) {
				$this->Session->setFlash('Not all Artists were deleted succesfully. Please try again.', 'error');
				return;
			}

			if (!empty($artists)) {
				if ($this->Artist->saveMany($this->request->data['Artist'])) {
					$this->Session->setFlash('The Artists were saved successfully.');
					$this->redirect(array('controller' => 'about'));
				} else {
					$this->Session->setFlash('There was a problem saving the artists. Please try again.', 'error');
				}
			} else {
				$this->Session->setFlash('The artists were saved successfully.');
				$this->redirect(array('controller' => 'about'));
			}
		} else {
			$artists = $this->Artist->find('all');
			$this->request->data['Artist'] = Set::combine($artists, '{n}.Artist.id', '{n}.Artist');
		}
	}
/**
 * edit method
 *
 * @throws NotFoundException
 * @param string $id
 * @return void
 */
	public function edit($id = null) {
		return $this->Pixelpod->handleAjaxEdit('Artist', $id);
	}

    public function beforeFilter() {
        parent::beforeFilter();

		$this->Security->unlockedActions = array('edit');
    }
}
