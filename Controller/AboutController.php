<?php
class AboutController extends AppController {
    var $name = 'About';
    var $uses = array('Artist', 'Field');

    function index() {
		$this->set('main_text', $this->Field->findById(1));
        $this->set('artists', $this->Artist->find('shown'));
    }

    function edit() {
    }

    function beforeFilter() {
        parent::beforeFilter();
        $this->set('controller_name','about');
    }
}
?>
