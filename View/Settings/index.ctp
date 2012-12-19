<div class="text_block">
<?php
echo $this->Form->create('Setting');

foreach ($this->data['Settings'] as $idx => $setting) {
    echo $this->Html->div('setting',
        $this->Form->input('Settings.'.$idx.'.id')."\n"
        .$this->Form->input('Settings.'.$idx.'.value',
            array('label' => $setting['description'])
        )
    );
}
?>
</div>
