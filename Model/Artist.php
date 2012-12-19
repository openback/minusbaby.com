<?php
App::uses('AppModel', 'Model');
/**
 * Artist Model
 *
 */
class Artist extends AppModel {

/**
 * Display field
 *
 * @var string
 */
	public $displayField = 'name';

/**
 * Validation rules
 *
 * @var array
 */
	public $validate = array(
		'sort_order' => array(
			'numeric' => array(
				'rule' => array('numeric'),
			),
		),
		'name' => array(
			'notempty' => array(
				'rule' => array('notempty'),
			),
		),
		'tag' => array(
			'notempty' => array(
				'rule' => array('notempty'),
			),
		),
		'url' => array(
			'url' => array(
				'rule' => array('url'),
				'allowEmpty' => true,
			),
		),
		'email' => array(
			'email' => array(
				'rule' => array('email'),
				'allowEmpty' => true,
			),
		),
		'bio' => array(
			'notempty' => array(
				'rule' => array('notempty'),
			),
		),
		'hidden' => array(
			'boolean' => array(
				'rule' => array('boolean'),
			),
		),
	);

	public $order = "sort_order asc";
	public $findMethods = array(
		'shown' => true,
		'forContact' => true
	);

	protected function _findForContact($state, $query, $results = array()) {
		if ($state == 'before') {
			$query['conditions']['Artist.hidden'] = false;
			$query['conditions']['Artist.show_in_contact'] = true;
			return $query;
		}
		return $results;
	}
	protected function _findShown($state, $query, $results = array()) {
		if ($state == 'before') {
			$query['conditions']['Artist.hidden'] = false;
			return $query;
		}
		return $results;
	}
}
