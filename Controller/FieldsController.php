<?php
App::uses('AppController', 'Controller');
/**
 * Fields Controller
 *
 * @property Field $Field
 * @property AjaxComponent $Ajax
 */
class FieldsController extends AppController {

/**
 * Helpers
 *
 * @var array
 */
	//public $helpers = array();

/**
 * Components
 *
 * @var array
 */
	//public $components = array();


/**
 * edit method
 *
 * @throws NotFoundException
 * @param string $id
 * @return void
 */
	public function edit($id = null) {
		return $this->Pixelpod->handleAjaxEdit('Field', $id);
	}

	public function beforeFilter() {
		parent::beforeFilter();
		$this->Security->unlockedActions = array('edit');
	}
}
