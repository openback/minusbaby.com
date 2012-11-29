<?php
/* Song Test cases generated on: 2010-12-07 22:12:42 : 1291779162*/
App::import('Model', 'Song');

class SongTestCase extends CakeTestCase {
	var $fixtures = array('app.song', 'app.album');

	function startTest() {
		$this->Song =& ClassRegistry::init('Song');
	}

	function endTest() {
		unset($this->Song);
		ClassRegistry::flush();
	}

}
?>