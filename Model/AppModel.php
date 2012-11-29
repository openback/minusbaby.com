<?php
/**
 * Application model for Cake.
 *
 * This file is application-wide model file. You can put all
 * application-wide model-related methods here.
 *
 * PHP 5
 *
 * CakePHP(tm) : Rapid Development Framework (http://cakephp.org)
 * Copyright 2005-2011, Cake Software Foundation, Inc. (http://cakefoundation.org)
 *
 * Licensed under The MIT License
 * Redistributions of files must retain the above copyright notice.
 *
 * @copyright     Copyright 2005-2011, Cake Software Foundation, Inc. (http://cakefoundation.org)
 * @link          http://cakephp.org CakePHP(tm) Project
 * @package       app.Model
 * @since         CakePHP(tm) v 0.2.9
 * @license       MIT License (http://www.opensource.org/licenses/mit-license.php)
 */

App::uses('Model', 'Model');

/**
 * Application model for Cake.
 *
 * Add your application-wide methods in the class below, your models
 * will inherit them.
 *
 * @package       app.Model
 */
class AppModel extends Model {
	// Checks if all fields are empty(). Does not check recursively
	public function isEmpty($virtualFields = array(), $ignoreFields = array()) {
		$virtualFields = ($virtualFields == null)? array() : $virtualFields;
		$fields = array_merge(array_keys($this->schema()), $virtualFields);

		foreach ($fields as $field) {
			if (in_array($field, $ignoreFields))
				continue;

			if (Dot::get($this->data[$this->name], $field) != null)
				return false;
		}

		return true;
	}
}
