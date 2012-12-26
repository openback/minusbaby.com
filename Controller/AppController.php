<?php
class AppController extends Controller {
    var $uses = array('Settings');
    var $components = array(
		'Auth' => array(
			'authorize' => 'Controller',
			'loginRedirect' => '/news',
			'logoutRedirect' => '/news',
			'ajaxLogin' => 'ajax_no_auth',
			'authError' => 'You are not allowed to do that.',
		),
        'Cookie',
        'DebugKit.Toolbar',
		'Pixelpod',
        'RequestHandler' => array(
			'viewClassMap' => array(
				'json' => 'PixelpodJson',
			)
		),
		'Security' => array(
			'csrfUseOnce' => false,
			'csrfExpires' => '+1 hour'
		),
		'Session'
    );
    var $helpers = array(
        // 'Asset.asset',
		'Fck',
        'Form',
        'Html',
        // 'Javascript',
        'Pixelpod',
        'Session',
        'Text'
    );

    /* Called by Auth Component
     * We have no special roles, so if logged in, we're good
     */
    function isAuthorized() {
		return true;
    }

	public function blackhole($type) {
		// TODO: Handle errors
		print_r($type);
	}

    function beforeFilter() {
		/*
		// Turn off debugging ALWAYS when using AJAX or we're gonna have a bad time
		if ($this->request->is('ajax')) {
            Configure::write('debug', 0);
            $this->autoLayout = false;
        }
		*/

        /* Security settings */
		$this->Security->blackHoleCallback = 'blackhole';
		$this->Security->unlockedActions = array('view');

        /* Auth settings */
		$this->Auth->deny();
		$this->Auth->allow('index', 'view', 'sql_explain');

        // keep anyone from editing the site while I do things
		if (Configure::read( "System.maintenance" ) && (AuthComponent::user('id') != 1) &&
			($this->request->here != '/maintenance') && ($this->request->here != '/login')
		) {
			$this->redirect('/maintenance', 503);
		}

        /* general */
        $this->set('controller_name', '');
		$this->set('menu', Configure::read('Menu'));
		$this->set('monobomb', Configure::read('Monobomb'));
    }
}
