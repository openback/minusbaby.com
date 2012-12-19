<?php
    $event_count = count($venue['Event']);
?>
<?php echo $this->Pixelpod->makeEditable('h2', $venue, array('class' => 'name no-p no-bar', 'label' => 'Name'), 'venues', 'Venue', 'name'); ?>
<a class="icon link site_url" href="<?php echo $venue['Venue']['url']; ?>" target="_blank"></a>
<?php echo $this->Pixelpod->makeEditable('div', $venue, array('class' => 'url no-p no-bar', 'label' => 'URL'), 'venues', 'Venue', 'url'); ?>
<?php echo $this->Pixelpod->makeEditable('div', $venue, array('class' => 'address1 no-p no-bar', 'label' => 'Address 1'), 'venues', 'Venue', 'address1'); ?>
<?php echo $this->Pixelpod->makeEditable('div', $venue, array('class' => 'address2 no-p no-bar', 'label' => 'Address 2'), 'venues', 'Venue', 'address2'); ?>
<?php echo $this->Pixelpod->makeEditable('div', $venue, array('class' => 'city no-p no-bar', 'label' => 'City'), 'venues', 'Venue', 'city'); ?>,
<?php echo $this->Pixelpod->makeEditable('div', $venue, array('class' => 'state no-p no-bar', 'label' => 'State'), 'venues', 'Venue', 'state'); ?>&nbsp;
<?php echo $this->Pixelpod->makeEditable('div', $venue, array('class' => 'zip no-p no-bar', 'label' => 'Zip'), 'venues', 'Venue', 'zip'); ?><br>
<?php echo $this->Pixelpod->makeEditable('div', $venue, array('class' => 'country no-p no-bar', 'label' => 'Country'), 'venues', 'Venue', 'country'); ?>
<a class="map" href="<?php echo $venue['Venue']['map']; ?>" target="_blank"><span class="icon link"></span> View map</a>
<span class="count">Assigned to <?php echo $event_count; ?> event<?php echo ($event_count == 1)? '' : 's'; ?></span><br>
<?php echo $this->Html->link('DELETE', array('action' => 'delete', $venue['Venue']['id']), null, "Are you sure you want to delete this venue? All dependent events will be deleted as well!");; ?>
