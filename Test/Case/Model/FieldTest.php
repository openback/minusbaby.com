<?php
App::uses('Field', 'Model');

/**
 * Field Test Case
 *
 */
class FieldTest extends CakeTestCase {

/**
 * Fixtures
 *
 * @var array
 */
	public $fixtures = array(
		'app.field'
	);

/**
 * setUp method
 *
 * @return void
 */
	public function setUp() {
		parent::setUp();
		$this->Field = ClassRegistry::init('Field');
	}

/**
 * tearDown method
 *
 * @return void
 */
	public function tearDown() {
		unset($this->Field);

		parent::tearDown();
	}

}
