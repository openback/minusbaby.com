<nav class="articles">
	<h1>Articles</h1>
	<ul>
<?php foreach($posts as $post) { ?>
		<li><a href="<?php echo $this->Html->url(array('action' => 'view', $post['Post']['id'], $post['Post']['slug'])); ?>"><span class="light"></span><span class="title"><?php echo $post['Post']['title']; ?></span><?php echo $this->Pixelpod->time(null, $post['Post']['date']); ?></a></li>
<?php } ?>
	</ul>
</nav>
<?php if (AuthComponent::user('id') != null) { ?>
<div class="admin">
	<a href="<?php echo $this->Html->url(array('action' => 'add')); ?>" class="wide-link">NEW POST</a>
</div>
<?php } ?>
<div id="posts">
	<?php echo $this->element('paginated_posts'); ?>
	<div class="loading"><?php echo $this->Html->image('lightbox-ico-loading.gif', array('alt' => 'loading')); ?></div>
</div>
