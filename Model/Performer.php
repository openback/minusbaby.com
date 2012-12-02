<?php
class Performer extends AppModel {
    public $name = 'Performer';
    public $belongsTo = 'Event';
    public $validate = array(
        'name' => array(
            'rule' => 'notEmpty',
            'required' => true,
		),
		'url' => array(
			'rule' => 'url',
			'allowEmpty' => true,
		),
    );
}
?>
