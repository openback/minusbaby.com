<nav class="videos">
	<h1>More Videos</h1>
	<ul>
	<?php foreach($videos as $v) { ?>
		<li>
			<a href="<?php echo $this->Html->url(array('action' => 'view', $v['Video']['id'], $v['Video']['slug'])); ?>">
				<figure>
					<?php echo $this->Html->image($v['Video']['thumbnail_url'], array('width' => 208, 'alt' => 'Video thumbnail')); ?>
					<figcaption><?php echo $v['Video']['title']; ?></figcaption>
				</figure>
			</a>
		</li>
	<?php } ?>
	</ul>
</nav>
<article class="now-playing">
	<figure>
		<figcaption>
		<h1><?php echo $video['Video']['title']; ?></h1><span class="slash">/</span><a href="<?php echo $video['Video']['url']; ?>"><?php echo $video['Video']['url']; ?></a>
		</figcaption>
		<?php echo $video['Video']['embed']; ?>
	</figure>
	<p><?php echo $video['Video']['description']; ?></p>
	<?php if ($this->Session->check('Auth.User')) { ?>
	<div class="admin">
		<a href="<?php echo Router::url(array('action' => 'add')); ?>">ADD</a>
		<a href="<?php echo Router::url(array('action' => 'edit', $video['Video']['id'])); ?>">EDIT</a>
		<?php echo $this->Html->link('DELETE', array('action' => 'delete', $video['Video']['id']), 'Are you sure you want to delete this video?'); ?>
		<a href="<?php echo Router::url(array('action' => 'sort')); ?>">SORT</a>
	</div>
	<?php } ?>
</article>
