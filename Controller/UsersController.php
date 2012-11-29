<?php
App::uses('AppController', 'Controller');
/**
 * Users Controller
 *
 * @property User $User
 */
class UsersController extends AppController {
	/**
	 * login method
	 *
	 * @return void
	 */
	function login() {
		if ($this->request->is('post')) {
			if ($this->Auth->login()) {
				$this->Session->setFlash(__('Welcome') . ', ' . AuthComponent::user('username'), 'flash_success', array(), 'auth');
				return $this->redirect($this->Auth->redirect());
			} else {
				$this->Session->setFlash(__('Username or password is incorrect'), 'error', array(), 'auth');
			}
		}
	}

	/**
	 * logout method
	 *
	 * @return void
	 */
	function logout() {
		$this->Session->setFlash('You have been logged out.');
		$this->redirect($this->Auth->logout());
	}

	/**
	 * index method
	 *
	 * @return void
	 */
	public function index() {
		if ($this->request->is('post')) {
			if (isset($this->request->data['cancel'])) {
				$this->Session->setFlash('Editing was canceled.');
				$this->redirect('/');
			}

			$deleteSuccessful = true;

			$users = array();
			foreach($this->request->data['User'] as $user) {
				if (empty($user['id']) && empty($user['username'])) {
					continue;
				}

				if (isset($user['delete']) && $user['delete']) {
					if (!$this->User->delete($user['id'])) {
						$deleteSuccessful = false;
						$this->Session->setFlash('Not all users were saved succesfully. Please try again.', 'error');
						// it didn't delete, so leave it in our data array
						$users[] = $user;
					}
				} else {
					if (empty($user['id'])) { unset($user['id']); }
					$users[] = $user;
				}
			}

			$this->request->data['User'] = $users;

			if ($this->User->saveMany($this->request->data['User'])) {
				if ($deleteSuccessful) {
					$this->Session->setFlash('The users were saved succesfully.');
					$this->request->data['User'] = Set::combine($this->User->find('all'), '{n}.User.id', '{n}.User');
					$this->request->data['User'] = array_values($this->request->data['User']);
				}
			} else {
				if ($deleteSuccessful) {
					$this->Session->setFlash('There was a problem saving the users.', 'error');
				}
			}
		} else {
			$this->request->data['User'] = Set::combine($this->User->find('all'), '{n}.User.id', '{n}.User');
			$this->request->data['User'] = array_values($this->request->data['User']);
		}
	}

	/**
	 * add method
	 *
	 * @return void
	 */
	public function add() {
		if ($this->request->is('post')) {
			$this->User->create();
			if ($this->User->save($this->request->data)) {
				$this->Session->setFlash(__('The user has been saved'));
				$this->redirect(array('action' => 'index'));
			} else {
				$this->Session->setFlash(__('The user could not be saved. Please, try again.'));
			}
		}
	}

	/**
	 * edit method
	 *
	 * @param string $id
	 * @return void
	 */
	public function edit($id = null) {
		$this->User->id = $id;
		if (!$this->User->exists()) {
			throw new NotFoundException(__('Invalid user'));
		}
		if ($this->request->is('post') || $this->request->is('put')) {
			if ($this->User->save($this->request->data)) {
				$this->Session->setFlash(__('The user has been saved'));
				$this->redirect(array('action' => 'index'));
			} else {
				$this->Session->setFlash(__('The user could not be saved. Please, try again.'));
			}
		} else {
			$this->request->data = $this->User->read(null, $id);
		}
	}

	/**
	 * delete method
	 *
	 * @param string $id
	 * @return void
	 */
	public function delete($id = null) {
		if (!$this->request->is('post')) {
			throw new MethodNotAllowedException();
		}
		$this->User->id = $id;
		if (!$this->User->exists()) {
			throw new NotFoundException(__('Invalid user'));
		}
		if ($this->User->delete()) {
			$this->Session->setFlash(__('User deleted'));
			$this->redirect(array('action'=>'index'));
		}
		$this->Session->setFlash(__('User was not deleted'));
		$this->redirect(array('action' => 'index'));
	}


	/**
	 * beforeFilter method
	 *
	 * @return void
	 */
	public function beforeFilter() {
		parent::beforeFilter();

		$this->Auth->deny('index', 'view');
	}
}
