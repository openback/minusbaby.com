<fieldset>
	<legend>Artists</legend>
	<hr>
	<table id="videos">
		<thead><td>Thumb</td><td>Title</td></thead>
		<tbody>
		<?php foreach ($videos as $idx => $video): ?>
			<tr id="<?php echo $video['Video']['id']; ?>">
				<td><?php echo $this->Html->image($video['Video']['thumbnail_url'], array('width' => 104, 'alt' => 'Video thumbnail')); ?></td>
				<td><?php echo $video['Video']['title']; ?></td>
			</tr>
		<?php endforeach; ?>
		</tbody>
	</table>
</fieldset>
<?php
	echo $this->Form->create('Video', array('class' => 'hidden'));
	echo $this->Form->input('ids', array('type' => 'text', 'label' => false, 'div' => false));
	echo $this->Form->end();
?>
