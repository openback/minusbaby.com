<?php echo $this->Form->create(); ?>
<fieldset>
	<legend>Sites</legend>
	<hr>
	<table class="sites">
		<thead><td></td><td>Name</td><td>URL</td><td>Hide</td><td>Delete</td></thead>
		<tbody>
		<?php foreach ($this->request->data['Site'] as $idx => $site): ?>
			<tr>
				<td><div class="drag"></div></td>
				<td>
					<?php if (!empty($site['id'])) { echo $this->Form->input("Site.{$idx}.id"); }?>
					<?php echo $this->Form->input("Site.{$idx}.sort_order", array('label' => false, 'div' => false, 'class' => 'hidden')); ?>
					<?php echo $this->Form->input("Site.{$idx}.name", array('label' => false)); ?>
				</td>
				<td><?php echo $this->Form->input("Site.{$idx}.url", array('type' => 'url', 'label' => false)); ?></td>
				<td><?php echo $this->Form->input("Site.{$idx}.hidden", array('type' => 'checkbox', 'label' => false)); ?>
				<td>
					<?php
						if (!empty($site['id'])) {
							echo $this->Form->input("Site.{$idx}.delete", array('type' => 'checkbox', 'label' => false));
						} else {
					?>
						<a href="#" class="remove-row-from-table delete">REMOVE</a>
					<?php } ?>
				</td>
			</tr>
		<?php endforeach; ?>
		</tbody>
	</table>
	<a href="#" class="add-row-from-table wide-link" data-table-selector=".sites">Add Site</a>
<?php
	echo $this->Form->button(__('Submit'), array('name' => 'submit', 'type' => 'submit', 'div' => false));
	echo $this->Form->button(__('Cancel'), array('name' => 'cancel', 'type' => 'submit', 'div' => false));
?>
</fieldset>
<?php
echo $this->Form->end();
?>
