<?php
// The top monobomb sites navigator
Configure::write('Monobomb',
	array(
		array('url' => 'http://crashfaster.com', 'class' => 'crashfaster', 'name' => 'crashfaster'),
		array('url' => 'http://awkwardterrible.tumblr.com', 'class' => 'awkward', 'name' => 'Awkward Terrible'),
		array('url' => 'http://spacetownsavior.bandcamp.com', 'class' => 'savior', 'name' => 'Space Town Savior'),
		array('url' => 'http://encowell.com', 'class' => 'cowell', 'name' => 'E.N. Cowell'),
		array('url' => '#', 'class' => 'tracer', 'name' => 'TRACER'),
		array('url' => 'http://minusbaby.com', 'class' => 'minusbaby', 'name' => 'minusbaby'),
		array('url' => 'http://zenalbatross.net', 'class' => 'zen', 'name' => 'Zen Albatross'),
	)
);

/**
 * Defines the specifics of this site
 */
define('DEFAULT_ARTIST', 'crashfaster');
define('SITE_TITLE', 'Crashfaster');
define('NEWS_LOGO', 'crashfaster_logo_64x11.png');
define('FOOTER_IMAGE', 'crashfaster_logo_footer.png');

Configure::write('Menu',
	array(
		array('name' => 'ABOUT',   'controller' => 'about'),
		array('name' => 'MUSIC',   'controller' => 'music'),
		array('name' => 'VIDEO',   'controller' => 'videos'),
		array('name' => 'EVENTS',  'controller' => 'events'),
		#array('name' => 'PRESS',   'controller' => 'press'),
		array('name' => 'CONTACT', 'controller' => 'contact'),
	)
);

/**
 * The level of CakePHP security.
 */
	Configure::write('Security.level', 'medium');

/**
 * A random string used in security hashing methods.
 */	Configure::write('Security.salt', 'd279e0ce34d7526e85734bae0a7b414427d364d8');

/**
 * A random numeric string (digits only) used to encrypt/decrypt strings.
 */	Configure::write('Security.cipherSeed', '623634663431326136666462363265');
