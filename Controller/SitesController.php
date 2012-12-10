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

			$deleteSuccessful = true;
			$toDelete = array();
			$sites = array();

			foreach($this->request->data['Site'] as $site) {
				$this->Site->create($site);

				if ($this->Site->isEmpty(null, array('sort_order', 'hidden', 'delete')))
					continue;

				if (array_key_exists('delete', $site) && $site['delete']) {
					if (!$this->Site->delete()) {
						$deleteSuccessful = false;
						// it didn't delete, so leave it in our data array
						$sites[] = $site;
					}
				} else {
					$sites[] = $site;
				}
			}

			$this->request->data['Site'] = $sites;

			if (!$deleteSuccessful) {
				$this->Session->setFlash('Not all sites were deleted succesfully. Please try again.', 'error');
				return;
			}

			if (!empty($sites)) {
			   	if ($this->Site->saveMany($sites)) {
					$this->Session->setFlash('The sites were saved successfully.');
					$this->redirect(array('controller' => 'contact'));
				} else {
					$this->Session->setFlash('There was a problem saving the sites. Please try again.', 'error');
				}
			} else {
				$this->Session->setFlash('The sites were saved successfully.');
				$this->redirect(array('controller' => 'contact'));
			}
		} else {
			$sites = $this->Site->find('all');
			$this->request->data['Site'] = Set::combine($sites, '{n}.Site.id', '{n}.Site');
		}
	}

    public function beforeFilter() {
        parent::beforeFilter();

		$this->Security->unlockedActions = array('index');
    }

}
