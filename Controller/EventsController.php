<?php
class EventsController extends AppController {
    public $name = 'Event';
    public $uses = array('Event','Performer', 'Venue');
    public $helpers = array('CountryList', 'Time', 'Text');
    public $components = array(
        'Attachment' => array(
            'rm_tmp_file' => true,
            'files_dir' => 'events',
            'allow_non_image_files' => false,
            'images_size' => array(
                'original' => true,
            )
        ),
        'Autocomplete' => array(
            'model' => 'Event',
            'allowed_fields' => array(
                'title',
                'age',
                'price',
                'external_url',
            )
        ),
    );

    function index() {
        $this->set('current', $this->Event->find('current'));
        $this->set('past', $this->Event->find('past'));
    }

    function view($id = null) {
		$event = $this->Event->findById($id);

        if (empty($event)) throw new NotFoundException();

		if ($this->request->is('ajax')) {
			$this->set('event', $event);
		} else {
			$this->set('current', array($event));
			$this->set('past', $this->Event->find('past'));
			$this->render('index');
		}
    }

    function add() {
		$this->Pixelpod->redirectIfCancel();
        $this->set('venues', $this->Venue->find('list', array('order' => 'name ASC')));

        if (empty($this->request->data)) {
            $this->request->data = array('Event' => array('using_existing_venue' => 1));
        } else {
			$this->removeEmptyPerformers();

            if (!empty($this->request->data['Event']['event']['name'])
				&& !$this->Attachment->upload($this->request->data['Event'])
			) {
				$this->Session->setFlash('There was an error saving the image.','flash_failure');
				return;
			}

            if ($this->request->data['Event']['using_existing_venue']) {
                unset($this->request->data['Venue']);
            } else {
                unset($this->request->data['Event']['venue_id']);
            }

            if ($this->Event->saveAll($this->request->data)) {
                $this->Session->setFlash('The event was created succesfully.','flash_success');
                $this->redirect(array('action' => 'index'));
            } else {
                $this->Session->setFlash('There was a problem creating the event.','flash_failure');
            }
        }

        $this->render('edit');
    }

    function edit($id = null) {
		$this->Event->id = $id;
        if (!$this->Event->exists()) {
			throw new NotFoundException();
        }

		$this->Pixelpod->redirectIfCancel(array('action' => 'view', $id, $this->Event->field('slug')));

		if (($this->request->is('post') || $this->request->is('put') && $this->request->is('ajax'))) {
			return $this->Pixelpod->handleAjaxEdit('Event', $id);
		}

        $this->set('venues', $this->Venue->find('list', array('order' => 'name ASC')));

        if (empty($this->request->data)) {
            $this->request->data = $this->Event->findById($id);
            $this->request->data['Event']['using_existing_venue'] = 1;
			return;
		}

		$this->removeEmptyPerformers();

		if (isset($this->request->data['Event']['delete_flier'])) {
			$this->Attachment->delete_files($this->request->data['Event']['event_file_path']);

			$this->request->data['Event']['event_file_path'] = null;
			$this->request->data['Event']['event_file_name'] = null;
			$this->request->data['Event']['event_file_size'] = null;
			$this->request->data['Event']['event_content_type'] = null;
		} else {
			if (!empty($this->request->data['Event']['event']['name'])) {
				if(!$this->Attachment->upload($this->request->data['Event'])) {
					$this->Session->setFlash('There was an error saving the image.','flash_failure');
					return;
				}
			}
		}

		// Delete any checked performers
		if (isset($this->request->data['Performer'])) {
			foreach($this->request->data['Performer'] as $index => &$performer) {
				if (isset($performer['delete']) && $performer['delete']) {
					if ($this->Performer->delete($performer['id'])) {
						// remove it from the data so it doesn't get created again
						unset($this->request->data['Performer'][$index]);
					} else {
						print_r($performer);
						$this->Session->setFlash('The '.$performer['role'].' could not be removed.', 'flash_failure');
						return;
					}
				}
			}
		}

		if (isset($this->Event->Performer->validate['event_id'])) {
			unset($this->Event->Performer->validate['event_id']);
		}

		if ($this->request->data['Event']['using_existing_venue']) {
			unset($this->request->data['Venue']);
		} else {
			if (isset($this->Event->validate['venue_id'])) {
				unset($this->Event->validate['venue_id']);
			}

			if (isset($this->request->data['Event']['venue_id'])) {
				unset($this->request->data['Event']['venue_id']);
			}
		}

		if ($this->Event->saveAll($this->request->data)) {
			$this->Session->setFlash('The event was updated succesfully.','flash_success');
			$this->redirect(array('action' => 'index'));
		} else {
			$this->Session->setFlash('There was a problem updating the event.','flash_failure');
		}
    }

    function delete($id) {
        $event = $this->Event->findbyId($id);
        $filename = $event['Event']['event_file_path'];

        if ($this->Event->delete($id)) {
            $this->Attachment->delete_files($filename);
            $this->Session->setFlash('The event was succesfully deleted.','flash_success');
            $this->redirect(array('action' => 'index'));
        } else {
            $this->Session->setFlash('There was a problem deleting the event.', 'flash_failure');
        }
    }

    function autocomplete($field) {
        $this->Autocomplete->find($field);
    }

	function removeEmptyPerformers() {
		if (!array_key_exists('Performer', $this->request->data)) {
			return;
		}
		foreach($this->request->data['Performer'] as $idx => $performer) {
			$this->Performer->create($performer);
			if ($this->Performer->isEmpty(null, array('event_id', 'role', 'delete'))) {
				unset($this->request->data['Performer'][$idx]);
			}
		}

		if (empty($this->request->data['Performer'])) {
			unset($this->request->data['Performer']);
		}
	}
    function beforeFilter() {
        parent::beforeFilter();
		$this->Security->unlockedActions = array('add', 'edit');
        $this->set('controller_name','events');
    }

}
