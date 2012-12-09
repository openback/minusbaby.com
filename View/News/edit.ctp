<?php echo $this->Form->create('Post', array('url' => array('controller' => 'news'), 'type' => 'file')); ?>
	<fieldset>
		<legend>EDIT NEWS POST</legend>
		<hr>
		<?php echo $this->Form->input('id'); ?>
		<div class="col-2">
			<?php echo $this->Form->input('title'); ?>
			<?php echo $this->Form->input('date', array('type' => 'text', 'class' => 'datepicker')); ?>
		</div>
		<div class="flier">
			<?php echo $this->Form->input('post', array('type' => 'file', 'label' => 'Image')); ?>
			<?php echo $this->Form->input('delete_image', array('type' => 'checkbox')); ?>
		</div>
		<?php echo $this->Form->input('embed'); ?>
		<?php echo $this->Form->input('description', array('class' => 'ckeditor')); ?>
		<?php echo $this->Form->input('post_file_path', array('type' => 'hidden')); ?>
		<?php echo $this->Form->input('post_file_name', array('type' => 'hidden')); ?>
		<?php echo $this->Form->input('post_file_size', array('type' => 'hidden')); ?>
		<?php echo $this->Form->input('content_type', array('type' => 'hidden')); ?>
		<!-- <?php echo $this->Form->button(__('Preview'), array('name' => 'preview', 'id' => 'preview', 'type' => 'submit', 'div' => false)); ?> -->
		<?php echo $this->Form->button(__('Submit'), array('name' => 'submit', 'type' => 'submit', 'div' => false)); ?>
		<?php echo $this->Form->button(__('Cancel'), array('name' => 'cancel', 'type' => 'submit', 'div' => false)); ?>
	</fieldset>
<?php echo $this->Form->end();; ?>
