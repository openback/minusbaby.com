<div class="text_block login">
<?php
echo $this->Form->create('User', array('action' => 'login'))
    .$this->Form->input('username')
    .$this->Form->input('password')
    .$this->Form->end('Log in');
?>
</div>
