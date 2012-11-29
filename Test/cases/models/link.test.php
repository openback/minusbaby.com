<?php
/* Link Test cases generated on: 2010-12-06 13:12:38 : 1291660538*/
App::import('Model', 'Link');

class LinkTestCase extends CakeTestCase {
	var $fixtures = array('app.link');

	function startTest() {
		$this->Link =& ClassRegistry::init('Link');
	}

	function endTest() {
		unset($this->Link);
		ClassRegistry::flush();
	}

}
?>