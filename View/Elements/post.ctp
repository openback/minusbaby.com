<?php
	$media = empty($post['Post']['embed'])
		? $this->Html->image('/attachments/tmp/'.$post['Post']['post_file_path'], array('width' => 720, 'alt' => $post['Post']['title']))
		: $post['Post']['embed'];
?>
<article class="post">
	<?php echo $this->Pixelpod->makeEditable('h1', $post, array('class' => 'title no-p no-bar'), 'news', 'Post', 'title'); ?>
	<time datetime="2012-09-16"><?php echo $post['Post']['date']; ?></time>
	<?php echo $media; ?>
	<?php echo $this->Pixelpod->makeEditable('div', $post, 'news', 'Post', 'description'); ?>
	<?php if (($this->action != 'preview') AND $this->Session->check('Auth.User')) { ?>
	<div class="block_row admin">
	  <?php echo $this->Html->link('Edit', array('action' => 'edit', $post['Post']['id'], $post['Post']['slug'])); ?>
	  <?php echo $this->Html->link('Delete', array('action' => 'delete', $post['Post']['id'], $post['Post']['slug']), null, 'Are you sure you want to delete this post?')?>
	</div>
	<?php } ?>
</article>