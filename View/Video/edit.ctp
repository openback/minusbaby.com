<?php echo $this->Form->create('Video', array('type' => 'file'));?>
    <fieldset>
        <legend><?php echo __('Edit Video'); ?></legend>
        <hr>
        <?php
            echo $this->Form->input('id');
            echo $this->Form->input('url', array('label' => 'Video URL', 'error' => array('attributes' => array('escape' => false))));
            echo $this->Form->input('data', array('name' => 'data[Video][import]', 'type' => 'checkbox', 'label' => 'Import the video source\'s title and description'));
            echo $this->Form->button(__('Submit'), array('name' => 'submit', 'type' => 'submit', 'div' => false));
            echo $this->Form->button(__('Cancel'), array('name' => 'cancel', 'type' => 'submit', 'div' => false));
		?>
    </fieldset>
<?php echo $this->Form->end();?>
