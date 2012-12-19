<?php
class FckHelper extends AppHelper {
	var $helpers = array('Html', 'Form');

	public function input($fieldName, $options = array()) {
		$did = '';
		$tmpName = str_replace('_','.',$fieldName);

		foreach (explode('.', $tmpName) as $v) {
			$did .= ucfirst($v);
		}
		$code = "CKEDITOR.replace( '".$did."' );";

		$this->Html->scriptBlock($code, array('block' => 'pageJs'));
		return $this->Form->input($fieldName, $options);
	}
}
