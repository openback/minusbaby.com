<?php echo $this->Form->create('Post', array('url' => array('controller' => 'news'), 'type' => 'file')); ?>
	<fieldset>
		<legend>NEW NEWS POST</legend>
		<hr>
		<?php echo $this->Form->input('title'); ?>
		<?php echo $this->Form->input('post', array('type' => 'file', 'label' => 'Image')); ?>
		<?php echo $this->Form->input('embed'); ?>
		<?php echo $this->Form->input('producer_name'); ?>
		<?php echo $this->Form->input('producer_url', array('type' => 'text')); ?>
		<?php echo $this->Form->input('production_name'); ?>
		<?php echo $this->Form->input('production_url', array('type' => 'text')); ?>
		<?php echo $this->Form->input('date', array('type' => 'text', 'class' => 'datepicker')); ?>
		<?php echo $this->Fck->input('Post.description'); ?>
		<?php echo $this->Form->input('download_text'); ?>
		<?php echo $this->Form->button(__('Preview'), array('name' => 'preview','id' => 'preview',  'type' => 'submit', 'div' => false)); ?>
		<?php echo $this->Form->button(__('Submit'), array('name' => 'submit', 'type' => 'submit', 'div' => false)); ?>
		<?php echo $this->Form->button(__('Cancel'), array('name' => 'cancel', 'type' => 'submit', 'div' => false)); ?>
	</fieldset>
<?php echo $this->Form->end(); ?>
