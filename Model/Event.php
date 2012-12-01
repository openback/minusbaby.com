<?php
App::uses('AppModel', 'Model');

class Event extends AppModel {
    public $name = 'Event';

    public $belongsTo = 'Venue';

	public $actsAs = array(
		'Utility.Sluggable'
	);

    public $hasMany = array(
        /* This is just to make the event form easier
         * TODO: Is there a better way?
         */
        'Performer' => array(
            'className' => 'Performer',
            'order' => 'name ASC',
            'dependent' => true,
        ),
        'Artist' => array(
            'className' => 'Performer',
            'conditions' => array('role' => 'artist'),
            'order' => 'name ASC',
            'dependent' => false,
        ),
        'Visualist' => array(
            'className' => 'Performer',
            'conditions' => array('role' => 'visualist'),
            'order' => 'name ASC',
            'dependent' => false,
        ),
    );
    public $validate = array(
        'title' => array(
            'rule' => 'notEmpty'
        ),
        'start_time' => array(
            'rule' => 'notEmpty'
        ),
        'external_url' => array(
            'rule' => 'url',
        ),
        'venue_id' => array(
            'rule' => 'numeric',
        ),
    );

	public $findMethods = array(
		'current' => true,
		'past' => true
	);

    var $order = 'start_time DESC';

	protected function _findCurrent($state, $query, $results = array()) {
		if ($state == 'before') {
			$query['conditions'] = array(
				'start_time >=' => date('Y-m-d H:i:s', strtotime('-4 hour')),
			);
			return $query;
		}
		return $results;
	}

    protected function _findPast($state, $query, $results = array()) {
		if ($state == 'before') {
			$query['conditions'] = array(
				'start_time <' => date('Y-m-d H:i:s', strtotime('-4 hour')),
			);
			$query['fields'] = array('start_time', 'title');
			$query['recursive'] = 0;
			return $query;
		}
		return $results;
    }

    function beforeValidate() {
        parent::beforeValidate();

        // ignore title if old
        if (!$this->isCurrent()) {
            unset($this->validate['title']);
        }
        return true;
    }

    protected function isCurrent() {
        $dif = (time() - strtotime($this->data['Event']['start_time']))/86400;
        return ($dif <= -4);
    }
}
?>
