<?php
App::uses('AppController', 'Controller');
/**
 * Fields Controller
 *
 * @property Field $Field
 * @property AjaxComponent $Ajax
 */
class SitesController extends AppController {
/**
 * index method
 *
 * @return void
 */
	public function index() {
		if ($this->request->is('post')) {
			$this->Pixelpod->redirectIfCancel(array('controller' => 'contact'));
			$this->removeEmptySites();

			$deleteSuccessful = true;

			$toDelete = array();
			$sites = array();

			foreach($this->request->data['Site'] as $site) {
				if (array_key_exists('delete', $site) && $site['delete']) {
					if (!$this->Site->delete($site['id'])) {
						if (!$deleteSuccessful) {
							$this->Session->setFlash('Not all sites were deleted succesfully. Please try again.', 'error');
						}
						$deleteSuccessful = false;
						// it didn't delete, so leave it in our data array
						$sites[] = $site;
					}
				} else {
					$sites[] = $site;
				}
			}

			if ($this->Site->saveMany($sites)) {
				$this->Session->setFlash('The sites were saved successfully.');
				$this->redirect(array('controller' => 'contact'));
			} else {
				$this->request->data['Site'] = $sites;
				$this->Session->setFlash('There was a problem saving the sites. Please try again.', 'flash_error');
			}
		} else {
			$sites = $this->Site->find('all');
			$this->request->data['Site'] = Set::combine($sites, '{n}.Site.id', '{n}.Site');
		}
	}

	private function removeEmptySites() {
		// Go through and remove any completely empty songs
		if (!array_key_exists('Site', $this->request->data)) {
			return;
		}

		foreach ($this->request->data['Site'] as $id => $site) {
			// Then check all of the actual fields
			$this->Site->create($site);

			if ($this->Site->isEmpty(null, array('sort_order', 'hidden', 'delete'))) {
				unset($this->request->data['Site'][$id]);
			}
		}

		if (empty($this->request->data['Site'])) {
			unset($this->request->data['Site']);
		}
	}

    public function beforeFilter() {
        parent::beforeFilter();

		$this->Security->unlockedActions = array('index');
    }

}
