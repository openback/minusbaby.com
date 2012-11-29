<?php
/* Link Fixture generated on: 2010-12-06 13:12:38 : 1291660538 */
class LinkFixture extends CakeTestFixture {
	var $name = 'Link';

	var $fields = array(
		'id' => array('type' => 'integer', 'null' => false, 'default' => NULL, 'length' => 32, 'key' => 'primary'),
		'name' => array('type' => 'string', 'null' => false, 'default' => NULL, 'length' => 1000, 'collate' => 'utf8_general_ci', 'charset' => 'utf8'),
		'country' => array('type' => 'string', 'null' => true, 'default' => NULL, 'length' => 2, 'collate' => 'utf8_general_ci', 'charset' => 'utf8'),
		'url' => array('type' => 'string', 'null' => true, 'default' => NULL, 'length' => 2000, 'collate' => 'utf8_general_ci', 'charset' => 'utf8'),
		'created' => array('type' => 'datetime', 'null' => true, 'default' => NULL),
		'modified' => array('type' => 'datetime', 'null' => true, 'default' => NULL),
		'indexes' => array('PRIMARY' => array('column' => 'id', 'unique' => 1)),
		'tableParameters' => array('charset' => 'utf8', 'collate' => 'utf8_general_ci', 'engine' => 'MyISAM')
	);

	var $records = array(
		array(
			'id' => 1,
			'name' => '2 Player Productions',
			'country' => 'US',
			'url' => 'http://www.2playerproductions.com/',
			'created' => '2010-12-06 13:35:38',
			'modified' => '2010-12-06 13:35:38'
		),
		array(
			'id' => 2,
			'name' => '8bit Today',
			'country' => 'NL',
			'url' => 'http://8bittoday.com/',
			'created' => '2010-12-06 13:35:38',
			'modified' => '2010-12-06 13:35:38'
		),
		array(
			'id' => 3,
			'name' => '8bitpeoples',
			'country' => 'US',
			'url' => 'http://8bitpeoples.com/',
			'created' => '2010-12-06 13:35:38',
			'modified' => '2010-12-06 13:35:38'
		),
	);
}
?>
