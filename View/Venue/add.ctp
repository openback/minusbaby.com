<?php echo $this->Form->create('Venue'); ?>
	<fieldset>
		<legend>NEW VENUE</legend>
		<hr>
		<?php echo $this->Form->input('id'); ?>
		<?php echo $this->Form->input('name'); ?>
		<?php echo $this->Form->input('url', array('type' => 'url', 'label' => 'URL')); ?>
		<?php echo $this->Form->input('address1', array('label' => 'Address 1')); ?>
		<?php echo $this->Form->input('address2', array('label' => 'Address 2')); ?>
		<?php echo $this->Form->input('city'); ?>
		<?php echo $this->Form->input('state'); ?>
		<?php echo $this->Form->input('zip', array('label' => 'Zip or Postal Code')); ?>
		<?php echo $this->Form->input('country'); ?>
		<?php echo $this->Form->button(__('Submit'), array('name' => 'submit', 'type' => 'submit', 'div' => false)); ?>
		<?php echo $this->Form->button(__('Cancel'), array('name' => 'cancel', 'type' => 'submit', 'div' => false)); ?>
	</fieldset>
<?php echo $this->Form->end(); ?>
