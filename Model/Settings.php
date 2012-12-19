<?php
class Settings extends AppModel {
    public $name = 'Settings';

    /**
     * Returns a configuration option
     *
     * @param string $key Configuration key
     * @returns mixed The setting
     */
    function get($key) {
        $this->data = $this->find('first', array('conditions' => array('Settings.key' => $key)));

        return $this->data['Settings']['value'];
    }

    /**
     * Sets a configuration option
     *
     * @param string $key Configuration key
     * @param mixed $value Configuration setting
     * @returns mixed The return value from the save attempt
     */
    function set($key, $value = null) {
        return $this->updateAll(array('value' => $value), array('key' => $key));
    }

}
