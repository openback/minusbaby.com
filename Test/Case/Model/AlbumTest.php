<?php
/* Album Test cases generated on: 2010-12-07 22:12:49 : 1291779169*/
App::uses('Album', 'Model');

class AlbumTest extends CakeTestCase {
	function setUp() {
		parent::setUp();

		$this->Album = ClassRegistry::init('Album');
	}

	function testFindEp() {
		// Grab the earliest release, since that will stay constant
		$result = $this->Album->find('ep', array('limit' => 1, 'order' => 'release_date ASC'));

		$this->assertNotEmpty($result);
		$this->assertEquals($result[0]['Album']['title'], 'Monkey Patch');
	}

	function testFindLp() {
		// Grab the earliest release, since that will stay constant
		$result = $this->Album->find('lp', array('limit' => 1, 'order' => 'release_date ASC'));

		// TODO: Test this properly
		$this->assertEmpty($result);
	}

	function testFindAppearsOn() {
		// Grab the earliest release, since that will stay constant
		$result = $this->Album->find('appearsOn', array('limit' => 1, 'order' => 'release_date ASC'));

		$this->assertNotEmpty($result);
		$this->assertEquals($result[0]['Album']['title'], 'Knifetank (The Albumhole)');
	}

	function testFindCompilations() {
		// Grab the earliest release, since that will stay constant
		$result = $this->Album->find('compilation', array('limit' => 1, 'order' => 'release_date ASC'));

		$this->assertNotEmpty($result);
		$this->assertEquals($result[0]['Album']['title'], 'Micro_Superstarz_2000');
	}

	function testAutomaticArtist() {
		// LP and EP default to 'crashfaster'
		$album = $this->Album->find('ep', array('limit' => 1, 'order' => 'release_date ASC'));
		$album = $album[0];

		unset($album['Album']['id']);
		$album['Album']['artist'] = '';
		$newAlbum = $this->Album->save($album);
		$this->assertEquals($newAlbum['Album']['artist'], 'crashfaster');

		unset($album['Album']['id']);
		$album['Album']['artist'] = '';
		$album['Album']['type'] = 'LP';
		$newAlbum = $this->Album->save($album);
		$this->assertEquals($newAlbum['Album']['artist'], 'crashfaster');

		// The others should not
		unset($album['Album']['id']);
		$album['Album']['artist'] = '';
		$album['Album']['type'] = 'Appears on';
		$newAlbum = $this->Album->save($album);
		$this->assertEquals($newAlbum['Album']['artist'], 'Various Artists');

		unset($album['Album']['id']);
		$album['Album']['artist'] = '';
		$album['Album']['type'] = 'Compilation';
		$newAlbum = $this->Album->save($album);
		$this->assertEquals($newAlbum['Album']['artist'], 'Various Artists');
	}
}
?>
