<?php
/* Song Fixture generated on: 2010-12-07 22:12:42 : 1291779162 */
class SongFixture extends CakeTestFixture {
	var $name = 'Song';

	var $fields = array(
		'id' => array('type' => 'integer', 'null' => false, 'default' => NULL, 'length' => 32, 'key' => 'primary'),
		'album_id' => array('type' => 'integer', 'null' => false, 'default' => NULL, 'length' => 32),
		'artist' => array('type' => 'string', 'null' => false, 'default' => NULL, 'length' => 140, 'collate' => 'utf8_general_ci', 'charset' => 'utf8'),
		'title' => array('type' => 'string', 'null' => false, 'default' => NULL, 'length' => 140, 'collate' => 'utf8_general_ci', 'charset' => 'utf8'),
		'url' => array('type' => 'string', 'null' => true, 'default' => NULL, 'length' => 2048, 'collate' => 'utf8_general_ci', 'charset' => 'utf8'),
		'number' => array('type' => 'integer', 'null' => false, 'default' => NULL, 'length' => 2),
		'length' => array('type' => 'string', 'null' => true, 'default' => NULL, 'length' => 5, 'collate' => 'utf8_general_ci', 'charset' => 'utf8'),
		'downloads' => array('type' => 'integer', 'null' => false, 'default' => NULL, 'length' => 32),
		'file_size' => array('type' => 'integer', 'null' => false, 'default' => NULL, 'length' => 32),
		'created' => array('type' => 'datetime', 'null' => true, 'default' => NULL),
		'modified' => array('type' => 'datetime', 'null' => true, 'default' => NULL),
		'indexes' => array('PRIMARY' => array('column' => 'id', 'unique' => 1)),
		'tableParameters' => array('charset' => 'utf8', 'collate' => 'utf8_general_ci', 'engine' => 'MyISAM')
	);

        // Albums:
        // 1 - Derecha
        // 2 - Left Remixes, Pt. 2
        // 3 - Drum Machine Collection
        // 4 - Diversity is Forbidden
        // TODO: Add files!
	var $records = array(
		array(
			'id' => 1,
			'album_id' => 1,
			'artist' => 'minusbaby',
			'title' => 'Algzèbres, Pts. A-M',
			'url' => null,
			'number' => 1,
                        'length' => '2:20',
                        'downloads' => 0,
                        'file_size' => 0,
			'created' => '2010-12-07 22:32:42',
			'modified' => '2010-12-07 22:32:42'
		),
		array(
			'id' => 2,
			'album_id' => 1,
			'artist' => 'minusbaby',
			'title' => 'Algzèbres, Pts. N-Z',
			'url' => null,
			'number' => 2,
                        'length' => '2:20',
                        'downloads' => 0,
                        'file_size' => 0,
			'created' => '2010-12-07 22:32:42',
			'modified' => '2010-12-07 22:32:42'
		),
		array(
			'id' => 3,
			'album_id' => 1,
			'artist' => 'minusbaby',
			'title' => 'Transmitiendo Señales Mezcladas',
			'url' => null,
			'number' => 3,
                        'length' => '2:20',
                        'downloads' => 0,
                        'file_size' => 0,
			'created' => '2010-12-07 22:32:42',
			'modified' => '2010-12-07 22:32:42'
		),
		array(
			'id' => 4,
			'album_id' => 1,
			'artist' => 'minusbaby',
			'title' => 'Una Caja de los Ochentas',
			'url' => null,
			'number' => 4,
                        'length' => '2:20',
                        'downloads' => 0,
                        'file_size' => 0,
			'created' => '2010-12-07 22:32:42',
			'modified' => '2010-12-07 22:32:42'
		),
		array(
			'id' => 5,
			'album_id' => 1,
			'artist' => 'minusbaby',
			'title' => 'Fuiste Fuerte',
			'url' => null,
			'number' => 5,
                        'length' => '2:20',
                        'downloads' => 0,
                        'file_size' => 0,
			'created' => '2010-12-07 22:32:42',
			'modified' => '2010-12-07 22:32:42'
		),
		array(
			'id' => 6,
			'album_id' => 1,
			'artist' => 'minusbaby',
			'title' => 'Números Inútiles',
			'url' => null,
			'number' => 6,
                        'length' => '2:20',
                        'downloads' => 0,
                        'file_size' => 0,
			'created' => '2010-12-07 22:32:42',
			'modified' => '2010-12-07 22:32:42'
		),
		array(
			'id' => 7,
			'album_id' => 2,
			'artist' => 'minusbaby',
			'title' => 'A Few Years Later [Video Edit]',
			'url' => null,
			'number' => 1,
                        'length' => '2:20',
                        'downloads' => 0,
                        'file_size' => 0,
			'created' => '2010-12-07 22:32:42',
			'modified' => '2010-12-07 22:32:42'
		),
		array(
			'id' => 8,
			'album_id' => 2,
			'artist' => 'minusbaby',
			'title' => '〃 [Awash Mix by Turing\'s Apple]',
			'url' => null,
			'number' => 2,
                        'length' => '2:20',
                        'downloads' => 0,
                        'file_size' => 0,
			'created' => '2010-12-07 22:32:42',
			'modified' => '2010-12-07 22:32:42'
		),
		array(
			'id' => 9,
			'album_id' => 2,
			'artist' => 'minusbaby',
			'title' => '〃 [Tim Koch\'s Nurofen Waffles Mix]',
			'url' => null,
			'number' => 3,
                        'length' => '2:20',
                        'downloads' => 0,
                        'file_size' => 0,
			'created' => '2010-12-07 22:32:42',
			'modified' => '2010-12-07 22:32:42'
		),
		array(
			'id' => 10,
			'album_id' => 2,
			'artist' => 'minusbaby',
			'title' => '〃 [Balún End of Summer Reinterpretation]',
			'url' => null,
			'number' => 4,
                        'length' => '2:20',
                        'downloads' => 0,
                        'file_size' => 0,
			'created' => '2010-12-07 22:32:42',
			'modified' => '2010-12-07 22:32:42'
		),
		array(
			'id' => 11,
			'album_id' => 2,
			'artist' => 'minusbaby',
			'title' => 'Algzèbres',
			'url' => null,
			'number' => 5,
                        'length' => '2:20',
                        'downloads' => 0,
                        'file_size' => 0,
			'created' => '2010-12-07 22:32:42',
			'modified' => '2010-12-07 22:32:42'
		),
	);
}
?>
