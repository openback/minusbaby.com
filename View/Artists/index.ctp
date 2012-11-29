<?php echo $this->Form->create(); ?>
<fieldset>
	<legend>Artists</legend>
	<hr>
	<table class="artists">
		<thead><td></td><td>Name</td><td>Tag</td><td>Email</td><td>Contact</td><td>Hide</td><td>Delete</td></thead>
		<tbody>
		<?php foreach ($this->request->data['Artist'] as $idx => $artist): ?>
			<tr>
				<td><div class="drag"></div></td>
				<td>
					<?php echo $this->Form->input("Artist.{$idx}.id"); ?>
					<?php echo $this->Form->input("Artist.{$idx}.sort_order", array('label' => false, 'div' => false, 'class' => 'hidden')); ?>
					<?php echo $this->Form->input("Artist.{$idx}.name", array('label' => false)); ?>
				</td>
				<td><?php echo $this->Form->input("Artist.{$idx}.tag", array('label' => false)); ?></td>
				<td><?php echo $this->Form->input("Artist.{$idx}.email", array('label' => false)); ?></td>
				<td><?php echo $this->Form->input("Artist.{$idx}.show_in_contact", array('type' => 'checkbox', 'label' => false)); ?>
				<td><?php echo $this->Form->input("Artist.{$idx}.hidden", array('type' => 'checkbox', 'label' => false)); ?>
				<td><?php echo $this->Form->input("Artist.{$idx}.delete", array('type' => 'checkbox', 'label' => false)); ?>
			</tr>
		<?php endforeach; ?>
		</tbody>
	</table>
	<a href="#" class="add-row-from-table wide-link" data-table-selector=".artists">Add Artist</a>
<?php
	echo $this->Form->button(__('Submit'), array('name' => 'submit', 'type' => 'submit', 'div' => false));
	echo $this->Form->button(__('Cancel'), array('name' => 'cancel', 'type' => 'submit', 'div' => false));
?>
</fieldset>
<?php
echo $this->Form->end();
?>
