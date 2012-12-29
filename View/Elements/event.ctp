<?php
	$start_time = $this->Time->fromString($event['Event']['start_time']);
	$start_date = date('Y F d', $start_time);
	$start_time = date('g:i A', $start_time);

	$address = array($event['Venue']['address1'], $event['Venue']['address2'], $event['Venue']['city']);

	if ($event['Venue']['country'] == 'US') {
		$address[] = $event['Venue']['state'];
		$address[] = $event['Venue']['zip'];
	}

	$address[] = $event['Venue']['country'];

	$address = str_replace(', ,', ',', implode(', ', $address));
	if (strpos($address, ', ') === 0) {
		$address = substr($address, 2);
	}

	$participants = DEFAULT_ARTIST;

	for($i = 0; $i < count($event['Artist']); $i++) {
		if (($i + 1) == count($event['Artist'])) {
			$participants .= ' and ';
		} else {
			$participants .= ', ';
		}

		$participants .= $this->Pixelpod->link_if_url($event['Artist'][$i]['name'], $event['Artist'][$i]['url'], array('target' => '_blank'));
	}

	if (count($event['Visualist'])) {
		$participants .= ' with visuals by ';
		// insert the first visualist
		$participants .= $this->Pixelpod->link_if_url($event['Visualist'][0]['name'], $event['Visualist'][0]['url'], array('target' => '_blank'));

		// now make a list if needed
		for($i = 1; $i < count($event['Visualist']); $i++) {
			if (($i + 1) == count($event['Visualist'])) {
				$participants .= ' and ';
			} else {
				$participants .= ', ';
			}

			$participants .= $this->Pixelpod->link_if_url($event['Visualist'][$i]['name'], $event['Visualist'][$i]['url'], array('target' => '_blank'));
		}
	}
?>
<article class="event">
	<div class="details">
		<time datetime="<?php echo $event['Event']['start_time']; ?>"><?php echo $start_date; ?><span class="slash"> / </span><?php echo $start_time; ?></time><span class="slash"> / </span>
		<h1 class="title"><?php echo $this->Pixelpod->link_if_url($event['Event']['title'], $event['Event']['external_url']); ?> at&nbsp;
		<?php echo $this->Pixelpod->link_if_url($event['Venue']['name'], $event['Venue']['url']); ?></h1><span class="slash"> / </span>
		<span class="address"><?php echo $address; ?></span>
	</div>
	<div class="participants"><?php echo $participants; ?></div>
	<figure>
		<?php echo $this->Html->image('/attachments/tmp/'.$event['Event']['event_file_path'], array('width' => 460)); ?>
		<figcaption><?php echo $this->Pixelpod->makeEditable('div', $event, 'events', 'Event', 'description'); ?></figcaption>
	</figure>
<?php if (AuthComponent::user('id') != null) { ?>
	<div class="admin">
		<a href="<?php echo $this->Html->url(array('action' => 'edit', $event['Event']['id'], $event['Event']['slug'])); ?>">EDIT</a>
		<?php echo $this->Html->link('DELETE', array('action' => 'delete', $event['Event']['id'], $event['Event']['slug']), null, 'Are you sure you want to delete this event?'); ?>
	</div>
<?php } ?>
</article>
