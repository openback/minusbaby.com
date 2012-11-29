<?php echo $this->Form->create('Event', array('type' => 'file')); ?>
	<fieldset>
		<legend>EVENT</legend>
		<?php echo $this->Form->input('id'); ?>
		<?php echo $this->Form->hidden('event_file_path'); ?>
		<div class="times col-2">
			<?php echo $this->Form->input('title'); ?>
			<?php echo $this->Form->input('start_time', array('type' => 'text', 'class' => 'datetimepicker')); ?>
		</div>
		<?php echo $this->Form->input('external_url', array('type' => 'url', 'label' => 'Event URL')); ?>
		<div class="flier">
			<?php echo $this->Form->input('event', array('type' => 'file', 'label' => 'Flier')); ?>
			<?php echo $this->Form->input('delete_flier', array('type' => 'checkbox', 'value' => 1, 'hiddenField' => false, 'label' => 'Delete Flier', 'class' => 'delete')); ?>
		</div>
		<?php echo $this->Fck->input('Event.description'); ?>
		<?php echo $this->Form->input('venue_id', array('div' => false)); ?>
		<?php echo $this->Form->input('using_existing_venue', array('type' => 'hidden')); ?>
		<a href="<?php echo $this->Html->url(array('action' => 'add')); ?>" class="new-venue wide-link">ADD NEW VENUE</a>
		<div class="venue-portion">
			<a href="#" class="existing-venue wide-link">USE EXISTING VENUE</a>
			<?php echo $this->Form->input('Venue.name'); ?>
			<?php echo $this->Form->input('Venue.url', array('type' => 'url', 'label' => 'URL')); ?>
			<?php echo $this->Form->input('Venue.address1', array('label' => 'Address 1')); ?>
			<?php echo $this->Form->input('Venue.address2', array('label' => 'Address 2')); ?>
			<?php echo $this->Form->input('Venue.city'); ?>
			<?php echo $this->Form->input('Venue.state'); ?>
			<?php echo $this->Form->input('Venue.zip', array('label' => 'Zip or Postal Code')); ?>
			<?php echo $this->Form->input('Venue.country'); ?>
		</div>
	</fieldset>
	<fieldset>
		<legend>PERFORMERS</legend>
		<table class="performers">
			<thead><tr><th>Name</th><th>URL</th><th>Role</th><th>X</th></tr></thead>
			<tbody>
		<?php
		if (!empty($this->data['Performer'])) {
			foreach($this->data['Performer'] as $index => $performer) {
		?>
				<tr>
					<td>
						<?php echo $this->Form->input("Performer.${index}.id"); ?>
						<?php echo $this->Form->input("Performer.${index}.name", array('label' => false)); ?>
					</td>
					<td><?php echo $this->Form->input("Performer.${index}.url", array('type' => 'text', 'label' => false)); ?></td>
					<td><?php echo $this->Form->input("Performer.${index}.role", array('type' => 'select', 'label' => false, 'options' => array('artist' => 'artist', 'visualist' => 'visualist'))); ?></td>
					<td><?php echo $this->Form->input("Performer.${index}.delete", array('type' => 'checkbox', 'label' => false)); ?></td>
				</tr>
		<?php
			}
		} else {
			//put one empty one in
		?>
				<tr>
					<td>
						<?php echo $this->Form->input("Performer.0.id"); ?>
						<?php echo $this->Form->input("Performer.0.name", array('label' => false)); ?>
					</td>
					<td><?php echo $this->Form->input("Performer.0.url", array('type' => 'text', 'label' => false)); ?></td>
					<td><?php echo $this->Form->input("Performer.0.role", array('type' => 'select', 'label' => false, 'options' => array('artist' => 'artist', 'visualist' => 'visualist'))); ?></td>
					<td></td>
				</tr>
		<?php
		}
		?>
			</tbody>
		</table>
		<a href="#" class="add-row-from-table wide-link" data-table-selector=".performers">Add A Performer</a>
	</fieldset>
	<?php echo $this->Form->button(__('Submit'), array('name' => 'submit', 'type' => 'submit', 'div' => false)); ?>
	<?php echo $this->Form->button(__('Cancel'), array('name' => 'cancel', 'type' => 'submit', 'div' => false)); ?>
<?php echo $this->Form->end(); ?>
