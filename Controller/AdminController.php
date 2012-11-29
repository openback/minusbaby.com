<?php
class AdminController extends AppController {
    var $name = 'Admin';
    var $uses = array('Settings');

    function toggleMaintenance() {
        if ($this->Settings->get('maintenance_mode')) {
            $this->Settings->set('maintenance_mode', '0');
        } else {
            $this->Settings->set('maintenance_mode', '1');
        }

        $this->redirect('/');
    }

    function beforeFilter() {
        parent::beforeFilter();
        $this->Auth->deny('*');
    }
}
?>
