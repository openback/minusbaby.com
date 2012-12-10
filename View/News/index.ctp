<?php
$id = ($this->request->params['action'] == 'view') ? $this->request->params['pass'][0] : null;

$this->Pixelpod->monobombNavigation('.all-articles', '.inner-articles', 'nav');

if (!empty($postsList)) {
?>
<div class="all-articles">
	<h1>News</h1>
	<div class="inner-articles">
<?php
    $currentYear = '';

	if ($this->request->params['action'] == 'view') {
        $thisPostYear = $this->Time->format('Y', $posts[0]['Post']['date']);
	}

    foreach($postsList as $post):
        $post = $post['Post'];
        $row = '';
        $year = '';
        $postYear = $this->Time->format('Y', $post['date']);
		$class = ($id == $post['id']) ? ' current' : null;

        if ($postYear != $currentYear):
			if ($currentYear != '') {
				echo '</ul></nav>';
			}

			$nav_class = (isset($thisPostYear) && ($thisPostYear == $postYear)) ? ' first-page' : '';
            $currentYear = $postYear;
?>
		<nav class="posts<?php echo $nav_class; ?>">
			<h2><strong><?php echo $postYear; ?></strong></h2>
			<ul>
<?php   endif; ?>
			<li><a id="post-<?php echo $post['id']; ?>" href="<?php echo $this->Html->url(array('action' => 'view', $post['id'], $post['slug'])); ?>" class="<?php echo $class; ?>"><span class="title"><?php echo $post['title']; ?></span><?php echo $this->Pixelpod->time(null, $post['date']); ?></a></li>
<?php endforeach; ?>
			</ul>
		</nav>
	</div>
</div>
<nav class="pager"><a class="back" href="#">&lt;</a><a class="close" href="#">X</a><a class="forward" href="#">&gt;</a></nav>
<a class="more" href="#">MORE</a>
<?php
}
?>
<?php if (AuthComponent::user('id') != null): ?>
<div class="admin">
	<a href="<?php echo $this->Html->url(array('action' => 'add')); ?>" class="wide-link">NEW POST</a>
</div>
<?php endif; ?>
<?php
foreach ($posts as $post)
    echo $this->element('post', array('post' => $post));
?>
<div class="loading"><?php echo $this->Html->image('loading.gif', array('alt' => 'loading')); ?></div>
