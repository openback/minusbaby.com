<?php
	$this->Pixelpod->monobombNavigation('.members', '.collaborator-wrapper', 'dl', '.pager', 2);
	$collaborator_chunks = array_chunk($artists, 4);
	echo $this->Pixelpod->makeEditable('article', $main_text, array(), 'fields', 'Field', 'content');
?>
<section class="members">
<h1>Collaborators<?php if (AuthComponent::user('id') !== null) { ?> <a href="<?php echo Router::url(array('controller' => 'artists')); ?>">MANAGE</a><?php } ?></h1>
	<div class="collaborator-wrapper">
		<?php foreach ($collaborator_chunks as $collaborators) { ?>
		<dl>
			<?php foreach ($collaborators as $artist) { ?>
			<?php	if ($artist['Artist']['email'] == 'hello@minusbaby.com') continue; ?>
			<dt>
				<?php echo $this->Pixelpod->makeEditable('div', $artist, array('class' => 'name no-p no-bar'), 'artists', 'Artist', 'name'); ?>
				<?php echo $this->Pixelpod->makeEditable('div', $artist, array('class' => 'instrument no-p no-bar'), 'artists', 'Artist', 'tag'); ?>
			</dt>
			<dd><?php echo $this->Pixelpod->makeEditable('div', $artist, array(), 'artists', 'Artist', 'bio'); ?></dd>
			<?php } ?>
		</dl>
		<?php } ?>
	</div>
</section>
<nav class="pager"><a class="back" href="#">&lt;</a><a class="close" href="#">X</a><a class="forward" href="#">&gt;</a></nav>
<a class="more" href="#">MORE</a>
