<h1>VENUES</h1>
<div class="pages"><?php echo $this->Paginator->numbers(); ?></div>
<ul class="venues">
<?php foreach($venues as $venue) { ?>
	<li class="<?php echo $venue['Venue']['id']; ?>"><?php echo $this->element('venue', array('venue' => $venue)); ?></li>
<?php } ?>
</ul>
<a href="<?php echo $this->Html->url(array('action' => 'add')); ?>" class="wide-link">ADD NEW VENUE</a>
<a href="<?php echo $this->Html->url(array('controller' => 'events', 'action' => 'add')); ?>" class="wide-link">ADD NEW EVENT</a>
<div class="pages"><?php echo $this->Paginator->numbers(); ?></div>
