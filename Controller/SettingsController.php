<?php
class SettingsController extends AppController {
    var $name = 'Settings';

    function index() {
        if (empty($this->data)) {
            $this->data['Settings'] = Set::combine(
                $this->Settings->find('all'),
                '{n}.Settings.id',
                '{n}.Settings'
            );
        } else {
            if ($this->settings->saveAll($this->data)) {
                $this->Session->setFlash('The settings were saved.', 'flash_success');
            } else {
                $this->Session->setFlash('The settings could not be saved.', 'flash_failure');
            }
        }
    }
}
