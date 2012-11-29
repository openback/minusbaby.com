<?php
App::uses('Component', 'Controller');

class PixelpodComponent extends Component {
	public function initialize(Controller $controller) {
		$this->controller = $controller;
	}

	public function redirectIfCancel($destination = array('action' => 'index')) {
		if (array_key_exists('cancel', $this->controller->request->data)) {
			$this->controller->Session->setFlash(__('The action has been cancelled'));
			$this->controller->redirect($destination);
		}
	}

	public function sendJSON($success, $data = null, $code = 1) {
		$this->controller->set('success', $success);
		$this->controller->set('data', $data);
		$this->controller->set('_serialize', array('data'));
	}

	public function handleAjaxEdit($model, $id) {
		$model = $this->controller->{$model};
		$success = true;
		$data = null;

		$model->id = $id;
		if (!$model->exists()) {
			$success = false;
			$data = "{$model} not found.";
		} else {
			if ($this->controller->request->is('post') || $this->controller->request->is('put')) {
				if (!$model->save($this->controller->request->data)) {
					$success = false;
					$data = $model->validationErrors;
				}
			}
		}

		$this->sendJSON($success, $data);
	}
}
