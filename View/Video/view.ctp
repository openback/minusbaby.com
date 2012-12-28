<?php
	$this->Pixelpod->monobombNavigation('.all-videos', '.videos-wrapper', 'ul', '.pager', 4, 'article.now-playing', 'video');
	$videos = array_chunk($videos, 3);
?>
<div class="all-videos">
	<h1>More</h1>
	<div class="videos-wrapper">
	<?php foreach($videos as $videos_chunk) { ?>
		<nav>
			<ul>
			<?php foreach($videos_chunk as $v) { ?>
				<li>
					<a id="video-<?php echo $v['Video']['id']; ?>" href="<?php echo $this->Html->url(array('action' => 'view', $v['Video']['id'], $v['Video']['slug'])); ?>">
						<figure>
							<?php echo $this->Html->image($v['Video']['thumbnail_url'], array('width' => 208, 'alt' => 'Video thumbnail')); ?>
							<figcaption class="title"><?php echo $v['Video']['title']; ?></figcaption>
						</figure>
					</a>
				</li>
			<?php } ?>
			</ul>
		</nav>
	<?php } ?>
	</div>
</div>
<nav class="pager"><a class="back" href="#">&lt;</a><a class="close" href="#">X</a><a class="forward" href="#">&gt;</a></nav>
<a class="more" href="#">MORE</a>
<?php echo $this->element('video', array('video' => $video)); ?>
<?php if (AuthComponent::user('id') != null) { ?>
<div class="admin">
	<a href="<?php echo Router::url(array('action' => 'add')); ?>">ADD</a>
	<a href="<?php echo Router::url(array('action' => 'sort')); ?>">SORT</a>
</div>
<?php } ?>
<div class="loading"><?php echo $this->Html->image('loading.gif', array('alt' => 'loading')); ?></div>
