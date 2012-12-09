<?php
$start_open = (empty($current))? ' start-open' : '';
$id = ($this->request->params['action'] == 'view') ? $this->request->params['pass'][0] : null;

$this->Pixelpod->monobombNavigation('.all-events', '.past-events', 'nav');

if (!empty($eventList)) {
?>
<div class="all-events<?php echo $start_open; ?>">
	<h1>Events</h1>
	<div class="past-events">
<?php
    $currentYear = '';

	if ($this->request->params['action'] == 'view') {
        $thisEventYear = $this->Time->format('Y', $current[0]['Event']['start_time']);
	}

    foreach($eventList as $event):
        $event = $event['Event'];
        $row = '';
        $year = '';
        $eventYear = $this->Time->format('Y', $event['start_time']);
		$class = ($id == $event['id']) ? ' current' : null;

        if ($eventYear != $currentYear):
			if ($currentYear != '') {
				echo "\t\t\t</ul>\n\t\t</nav>";
			}

			$nav_class = (isset($thisEventYear) && ($thisEventYear == $eventYear)) ? ' first-page' : '';
            $currentYear = $eventYear;
?>
		<nav class="events<?php echo $nav_class; ?>">
			<h2><strong><?php echo $eventYear; ?></strong></h2>
			<ul>
<?php   endif; ?>
			<li><a id="event-<?php echo $event['id']; ?>" href="<?php echo $this->Html->url(array('action' => 'view', $event['id'], $event['title'])); ?>" class="<?php echo $class; ?>"><span class="title"><?php echo $event['title']; ?></span><?php echo $this->Pixelpod->time(null, $event['start_time']); ?></a></li>
<?php endforeach; ?>
			</ul>
		</nav>
	</div>
</div>
<nav class="pager<?php echo $start_open; ?>"><a class="back" href="#">&lt;</a><a class="close" href="#">X</a><a class="forward" href="#">&gt;</a></nav>
<a class="more<?php echo $start_open; ?>" href="#">MORE</a>
<?php
}

if (empty($current)) {
	// Add a placeholder for our AJAX
?>
<article class="event hidden"></article>
<?php
} else {
	foreach ($current as $event) {
		echo $this->element('event', array('event' => $event));
	}
}

if ($this->Session->check('Auth.User')) {
?>
<div class="admin <?php echo $start_open; ?>">
	<a href="<?php echo $this->Html->url(array('action' => 'add')); ?>" class="wide-link">ADD NEW EVENT</a>
	<a href="<?php echo $this->Html->url(array('controller' => 'venues', 'action' => 'index')); ?>" class="wide-link">MANAGE VENUES</a>
</div>
<?php
}
?>
<div class="loading"><?php echo $this->Html->image('loading.gif', array('alt' => 'loading')); ?></div>
