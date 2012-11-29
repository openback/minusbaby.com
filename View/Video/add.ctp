<?php echo $this->Form->create('Video');?>
    <fieldset>
        <legend><?php echo __('Add Video'); ?></legend>
        <hr>
        <?php
            echo $this->Form->input('url', array('label' => 'Video URL', 'error' => array('attributes' => array('escape' => false))));
            echo $this->Form->button(__('Submit'), array('name' => 'submit', 'type' => 'submit', 'div' => false));
            echo $this->Form->button(__('Cancel'), array('name' => 'cancel', 'type' => 'submit', 'div' => false));
		?>
    </fieldset>
<?php echo $this->Form->end();?>
