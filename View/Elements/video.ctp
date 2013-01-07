<article class="now-playing">
	<figure>
		<figcaption>
		<?php echo $this->Pixelpod->makeEditable('h1', $video, array('class' => 'no-bar', 'label' => 'Title'), 'videos', 'Video', 'title'); ?><span class="slash">/</span><a href="<?php echo $video['Video']['url']; ?>"><?php echo $video['Video']['url']; ?></a>
		</figcaption>
		<?php echo $video['Video']['embed']; ?>
	</figure>
	<?php echo $this->Pixelpod->makeEditable('div', $video, array('label' => 'Description'), 'videos', 'Video', 'description'); ?>
	<?php if (AuthComponent::user('id') != null) { ?>
	<div class="admin">
		<a href="<?php echo Router::url(array('action' => 'edit', $video['Video']['id'])); ?>">CHANGE VIDEO</a>
		<?php echo $this->Html->link('DELETE', array('action' => 'delete', $video['Video']['id']), null, 'Are you sure you want to delete this video?'); ?>
	</div>
	<?php } ?>
</article>
