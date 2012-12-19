<?php
/* Song Test cases generated on: 2010-12-07 22:12:42 : 1291779162*/
App::uses('Song', 'Model');

class SongTestCase extends CakeTestCase {
	function setUp() {
		$this->Song = ClassRegistry::init('Song');
	}

	function testDelete() {
		// TODO: Test that deleting a song actually deletes the file
		$this->assertEquals('Test exists', true);
	}
}
?>
