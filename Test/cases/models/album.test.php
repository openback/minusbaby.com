<?php
/* Album Test cases generated on: 2010-12-07 22:12:49 : 1291779169*/
App::import('Model', 'Album');

class AlbumTestCase extends CakeTestCase {
	var $fixtures = array('app.album', 'app.song');

	function startTest() {
		$this->Album =& ClassRegistry::init('Album');
	}

        function testSolo() {
            $result = $this->Album->solo();

            $expected = array(
                array(
                    'Album' => array(
                        'id' => 1,
                        'type' => 'Solo',
                        'title' => 'Derecha',
                        'artist' => 'minusbaby',
                        'release_date' => '2010-12-07',
                        'label' => '8bitpeoples',
                        'label_url' => 'http://8bitpeoples.com',
                        'catalog_number' => '8BP110',
                        'formats' => 'MP3/CD',
                        'country' => 'US',
                        'url' => 'http://www.8bitpeoples.com/discography/8BP110',
                        'purchase_url' => null,
                        'license' => 'CC',
                        'comments' => 'It\'s surprising to me as someone who generally isn\'t that big on chip music that I\'m on my third straight play through minusbaby\'s new album, <i>Derecha</i>. And even though I admittedly get fidgety and impatient on hearing more than one song at any given time in any given genre (chronic musical ADD), here I am humming along like an asshole, more forcefully with each repeated listen, ad-libbing riffs here and there while I finger-drum beats on my desktop like a white Candido, and quickly approaching my fourth return listen.<br /> <br />As an album, it\'s a mature progression from his previous EP, <i>Left</i>. And it\'s damn good. And I want to tell people about it, but what do I even say?  It\'s chip music, but it doesn\'t sound like something from any video game I played when I was a kid. It\'s new music made with old-school mentality using a combination of sounds that could either be from 1985 or 2085. It\'s funky, it\'s danceable, it\'s composed, it\'s cerebral, it\'s performing a complicated samba throughout the <i>Southern Hemisphere</i> at times. It\'s all of these and yet it\'s none of these.<br /> <br />In a word, it\'s minusbaby.<br /> <br />Dylan Garret, DJ &bull; New York, NY &bull; July 2010',
                        'downloads' => 0,
                        'slug' => 'Derecha',
                    ),
                    'Song' => array()
                ),
                array(
                    'Album' => array(
                        'id' => 2,
                        'type' => 'Solo',
                        'title' => 'Left Remixes, Pt. 2',
                        'artist' => 'minusbaby',
                        'release_date' => '2010-04-26',
                        'label' => 'Self-Released',
                        'label_url' => null,
                        'catalog_number' => null,
                        'formats' => 'MP3',
                        'country' => 'US',
                        'url' => 'http://freemusicarchive.org/music/minusbaby/Left_Remixes_Pt_2/',
                        'purchase_url' => null,
                        'license' => 'CC',
                        'comments' => null,
                        'downloads' => 0,
                        'slug' => 'Left-Remixes-Pt-2',
                    ),
                    'Song' => array(),
                ),
            );

            $this->assertEqual($result, $expected);
        }

	function endTest() {
		unset($this->Album);
		ClassRegistry::flush();
	}

}
?>
