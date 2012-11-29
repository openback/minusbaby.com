<?php
	$this->Html->script('compiled/music', array('block' => 'pageJs'));

	if (!empty($lps)) {
		echo $this->element('album_list', array('title' => 'LPs', 'class' => 'lps', 'albums' => $lps));
	}

	if (!empty($eps)) {
		echo $this->element('album_list', array('title' => 'EPs', 'class' => 'eps', 'albums' => $eps));
	}

	if (!empty($compilations)) {
		echo $this->element('album_list', array('title' => 'Compilations', 'class' => 'compilations', 'albums' => $compilations));
	}

	if (!empty($appears_on)) {
		echo $this->element('album_list', array('title' => 'Appears On', 'class' => 'appears-on', 'albums' => $appears_on));
	}

	if ($this->Session->check('Auth.User')) {
		echo $this->Html->link('ADD RELEASE', array('action' => 'add'), array('class' => 'wide-link'));
	}
?>
