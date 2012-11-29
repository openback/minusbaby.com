<fieldset>
	<legend>Please log in.</legend>
	<hr>
	<?php echo $this->Form->create('User', array('action' => 'login')); ?>
	<?php echo $this->Form->input('username'); ?>
	<?php echo $this->Form->input('password'); ?>
	<?php echo $this->Form->button(__('Log in'), array('name' => 'submit', 'type' => 'submit', 'div' => false)); ?>
	<?php echo $this->Form->end(); ?>
</fieldset>
