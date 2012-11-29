<?php
App::uses('JsonView', 'View');

class PixelpodJsonView extends JsonView {
	public function render($view = null, $layout = null) {
		$data = parent::render($view, $layout);
		$success = (isset($this->viewVars['success']))? $this->viewVars['success'] : true;
		$code = (isset($this->viewVars['code']))? $this->viewVars['code'] : 1;

		if ($code > 10) {
			$success = false;
		}

		$tmpdata = json_decode($data);
		$data = (empty($tmpdata))? $data : $tmpdata;

		if (is_array($data) && array_key_exists($data, 'data')) {
			$data = $data['data'];
		} elseif (is_object($data) && property_exists($data, 'data') && (count((array)$data == 1))) {
			$data = $data->data;
		}

		return json_encode(array(
			'success' => $success,
			'data' => $data,
			'code' => $code
		));
	}
}
