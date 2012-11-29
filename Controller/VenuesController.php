<?php
class VenuesController extends AppController {
    public $name = 'Venue';
	public $paginate = array(
		'limit' => 12
	);

    function index() {
        $this->set('venues', $this->paginate('Venue'));
    }

    function add() {
        if (!empty($this->data)) {
            if ($this->Venue->save($this->data)) {
                $this->Session->setFlash('The venue was created successfully.', 'flash_success');
                $this->redirect(array('action' => 'index'));
            } else {
                $this->Session->setFlash('The venue could not be created.', 'flash_failure');
            }
        }
    }

    function delete($id) {
        if ($this->Venue->delete($id)) {
            $this->Session->setFlash('The venue and associated events were deleted.', 'flash_success');
        } else {
            $this->Session->setFlash('The venue could not be deleted', 'flash_failure');
        }

        $this->redirect(array('action' => 'index'));
    }

    function beforeFilter() {
        parent::beforeFilter();
    }
}
?>
