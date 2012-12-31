<?php
/**
 * Routes configuration
 *
 * In this file, you set up routes to your controllers and their actions.
 * Routes are very important mechanism that allows you to freely connect
 * different urls to chosen controllers and their actions (functions).
 *
 * PHP versions 4 and 5
 *
 * CakePHP(tm) : Rapid Development Framework (http://cakephp.org)
 * Copyright 2005-2010, Cake Software Foundation, Inc. (http://cakefoundation.org)
 *
 * Licensed under The MIT License
 * Redistributions of files must retain the above copyright notice.
 *
 * @copyright     Copyright 2005-2010, Cake Software Foundation, Inc. (http://cakefoundation.org)
 * @link          http://cakephp.org CakePHP(tm) Project
 * @package       cake
 * @subpackage    cake.app.config
 * @since         CakePHP(tm) v 0.2.9
 * @license       MIT License (http://www.opensource.org/licenses/mit-license.php)
 */
//Router::connect('/', array('controller' => 'landing'));
Router::parseExtensions('json');

Router::connect('/', array('controller' => 'home'));

Router::connect('/error/:code',
    array(
        'controller' => 'error',
        'action' => 'error',
    ),
    array(
        'pass' => array('code'),
        'code' => '[[:digit:]]+'
    )
);

Router::connect('/music/news', array('controller' => 'news', 'action' => 'index'));
Router::connect('/music/news/:action/*', array('controller' => 'news'));

Router::connect('/music/events', array('controller' => 'events', 'action' => 'index'));
Router::connect('/music/events/:action/*', array('controller' => 'events'));

Router::connect('/music/discography', array('controller' => 'music', 'action' => 'index'));
Router::connect('/music/discography/:action/*', array('controller' => 'music'));

Router::connect('/music/videos', array('controller' => 'videos', 'action' => 'index'));
Router::connect('/music/videos/:action/*', array('controller' => 'videos'));

Router::connect('/music/about', array('controller' => 'about', 'action' => 'index'));
Router::connect('/music/about/:action/*', array('controller' => 'about'));

Router::connect('/login',
    array(
        'controller' => 'users',
        'action' => 'login'
    )
);

Router::connect('/logout',
    array(
        'controller' => 'users',
        'action' => 'logout'
    )
);

/**
 * Load all plugin routes.  See the CakePlugin documentation on
 * how to customize the loading of plugin routes.
 */
	CakePlugin::routes();

/**
 * Load the CakePHP default routes. Remove this if you do not want to use
 * the built-in default routes.
 */
require CAKE . 'Config' . DS . 'routes.php';

