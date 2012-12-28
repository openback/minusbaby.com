<article class="now-playing">
	<figure>
		<figcaption>
		<h1><?php echo $video['Video']['title']; ?></h1><span class="slash">/</span><a href="<?php echo $video['Video']['url']; ?>"><?php echo $video['Video']['url']; ?></a>
		</figcaption>
		<?php echo $video['Video']['embed']; ?>
	</figure>
	<p><?php echo $video['Video']['description']; ?></p>
	<?php if (AuthComponent::user('id') != null) { ?>
	<div class="admin">
		<a href="<?php echo Router::url(array('action' => 'edit', $video['Video']['id'])); ?>">EDIT</a>
		<?php echo $this->Html->link('DELETE', array('action' => 'delete', $video['Video']['id']), 'Are you sure you want to delete this video?'); ?>
	</div>
	<?php } ?>
</article>
