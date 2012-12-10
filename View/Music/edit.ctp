<?php echo $this->Form->create('Album', array('url' => array('controller' => 'music'), 'type' => 'file')); ?>
	<fieldset>
		<legend>ALBUM</legend>
		<hr />
		<?php echo $this->Form->input('id'); ?>
		<?php echo $this->Form->hidden('cover_file_path'); ?>
		<?php echo $this->Form->hidden('thumbnail_cover_path'); ?>
		<div class="col-2">
			<?php echo $this->Form->input('title'); ?>
			<?php echo $this->Form->input('artist'); ?>
		</div>
		<div class="flier">
			<?php echo $this->Form->input('cover', array('type' => 'file', 'label' => 'Cover')); ?>
			<?php echo $this->Form->input('delete_cover',
					array(
						'type' => 'checkbox',
						'value' => 1,
						'hiddenField' => false,
						'label' => 'Delete Cover',
						'class' => 'delete',
					)
				);
			?>
		</div>
		<div class="flier">
			<?php echo $this->Form->input('thumbnail', array('type' => 'file', 'label' => 'Thumbnail')); ?>
			<?php echo $this->Form->input('delete_thumbnail',
					array(
						'type' => 'checkbox',
						'value' => 1,
						'hiddenField' => false,
						'label' => 'Delete Thumb',
						'class' => 'delete',
					)
				);
			?>
		</div>
		<?php // echo $this->Form->input('label'); ?>
		<?php // echo $this->Form->input('label_url', array('type' => 'text', 'label' => 'Label URL')); ?>
		<?php // echo $this->Form->input('catalog_number'); ?>
		<div class="col-2">
			<?php echo $this->Form->input('release_date',
					array(
						'type' => 'text',
						'class' => 'datepicker'
					)
				);
			?>
			<div class="input select">
				<label for="AlbumType">Type</label>
				<?php echo $this->Form->select('type',
						array(
							'EP' => 'EP',
							'LP' => 'LP',
							'Compilation' => 'Compilation',
							'Appears on' => 'Appears on'
						),
						array('empty' => false)
					);
				?>
			</div>
		</div>
		<?php // echo $this->Form->input('formats'); ?>
		<?php // echo $this->CountryList->select('Album.country',
			  //   	array(
			  //   		'label' => 'Country',
			  //   	)
			  //   );
		?>
		<div class="col-2">
			<?php echo $this->Form->input('url', array('type' => 'text', 'label' => 'Album URL')); ?>
			<?php echo $this->Form->input('purchase_url', array('type' => 'text', 'label' => 'Purchase URL')); ?>
		</div>
		<?php echo $this->Form->input('license'); ?>
		<?php echo $this->Fck->input('Album.comments'); ?>
	</fieldset>
	<fieldset>
		<legend>TRACKS</legend>
		<table class="songs">
			<thead><tr><th>URL or filename</th><th>#</th><th>Length</th><th>Artist</th><th>Title</th><th>Upload</th><th class="remove">X</th></tr></thead>
			<tbody>
<?php
if (!empty($this->data['Song'])) {
    foreach($this->data['Song'] as $index => $song) {
?>
				<tr>
					<td>
						<?php echo $this->Form->input("Song.{$index}.id"); ?>
						<?php echo $this->Form->input("Song.{$index}.url", array('type' => 'text', 'label' => false, 'class' => 'url')); ?>
					</td>
					<td><?php echo $this->Form->input("Song.{$index}.number", array('class' => 'number', 'label' => false, 'type' => 'text')); ?></td>
					<td><?php echo $this->Form->input("Song.{$index}.length", array('class' => 'length', 'label' => false)); ?></td>
					<td><?php echo $this->Form->input("Song.{$index}.artist", array('class' => 'artist', 'label' => false)); ?></td>
					<td><?php echo $this->Form->input("Song.{$index}.title", array('class' => 'title', 'label' => false)); ?></td>
					<td><?php echo $this->Form->input("Song.{$index}.song", array('type' => 'file', 'label' => false));; ?></td>
					<td>
						<?php if (empty($song['id'])): ?>
						<a href="#" class="remove-row-from-table delete">REMOVE</a>
						<?php else:
								echo $this->Form->input("Song.{$index}.delete", array('type' => 'checkbox', 'label' => false));
							  endif;
						?>
					</td>
				</tr>
<?php
    }
} else {
	// Just put one empty one in
?>
				<tr>
					<td>
						<?php echo $this->Form->input("Song.0.id"); ?>
						<?php echo $this->Form->input("Song.0.url", array('type' => 'text', 'label' => false, 'class' => 'url')); ?>
					</td>
					<td><?php echo $this->Form->input("Song.0.number", array('class' => 'number', 'label' => false, 'type' => 'text')); ?></td>
					<td><?php echo $this->Form->input("Song.0.length", array('class' => 'length', 'label' => false)); ?></td>
					<td><?php echo $this->Form->input("Song.0.artist", array('class' => 'artist', 'label' => false)); ?></td>
					<td><?php echo $this->Form->input("Song.0.title", array('class' => 'title', 'label' => false)); ?></td>
					<td><?php echo $this->Form->input("Song.0.song", array('type' => 'file', 'label' => false));; ?></td>
					<td><?php echo $this->Form->input("Song.0.delete", array('type' => 'checkbox', 'label' => false)); ?></td>
				</tr>
<?php
}
?>
			</tbody>
		</table>
		<a href="#" class="add-row-from-table wide-link" data-table-selector=".songs">Add A Song</a>
	</fieldset>
	<?php echo $this->Form->button(__('Submit'), array('name' => 'submit', 'type' => 'submit', 'div' => false)); ?>
	<?php echo $this->Form->button(__('Cancel'), array('name' => 'cancel', 'type' => 'submit', 'div' => false)); ?>
<?php echo $this->Form->end(); ?>
