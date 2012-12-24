<?php
class HomeController extends AppController {
	public $name = 'Home';
	public $uses = array();

	public function index() {
		$this->autoLayout = false;
		$this->set('page_class', 'landing-page');
	}
}
