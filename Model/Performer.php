<?php
class Performer extends AppModel {
    var $name = 'Performer';
    var $belongsTo = 'Event';
    var $validate = array(
        'name' => array(
            'rule' => 'notEmpty',
            'required' => true,
        ),
    );

    function beforeValidate($options = array()) {
        // optional url validation is always buggy for me, so this is the fix
        $url_validation = array(
            'rule' => 'url',
            'required' => true,
            'message' => 'This must be a valid URL',
        );

        $url_fields = array('url');

        foreach($url_fields as $field) {
            if (!empty($this->data[$this->name][$field])) {
                $this->validate[$field] = $url_validation;
            } else {
                if (isset($this->validate[$field])) {
                    unset($this->validate[$field]);
                }
            }
        }

        return true;
    }
}
?>
