<?php
	$this->Html->script('jquery.jplayer.min', array('block' => 'pageJs'));
	$this->Html->script('compiled/music', array('block' => 'pageJs'));

	/* COVER IMAGES */
	if (empty($album['Album']['thumbnail_file_path'])) {
		$thumbnail = 'no_album_cover.png';
	} else {
		$thumbnail = '/attachments/album-covers/original/'.$album['Album']['thumbnail_file_path'];
	}

	// Should I set width to 450 here?
	$cover = $this->Pixelpod->link_if(
		!empty($album['Album']['cover_file_path']),
		$this->Html->image($thumbnail, array('class'=>'cover', 'alt' => $album['Album']['title'].' cover')),
		'/attachments/album-covers/original/'.$album['Album']['cover_file_path'],
		array('class' => 'cover', 'escape' => false)
	);

	/* LICENSE */
	$license = $album['Album']['license'];

	if (strtolower($license) == 'cc') {
		$license = $this->Html->link(
			$this->Html->image('cc.png', array('alt' => 'Creative Commons')),
			'http://creativecommons.org/licenses/by-nc-nd/3.0/',
			array('target' => '_blank', 'escape' => false)
		);
	}
?>
<div class="images"><?php echo $cover; ?></div>
<nav class="images"><a class="active" href="#">1</a><a href="#">2</a><a href="#">3</a></nav>
<section class="details">
	<dl>
		<dt>Title</dt>
		<dd><?php echo $album['Album']['title']; ?></dd>
		<dt>Year</dt>
		<dd><?php echo $this->Pixelpod->time($album['Album']['release_date']); ?></dd>
		<dt>Artist</dt>
		<dd><?php echo $album['Album']['artist']; ?></dd>
		<?php if (count($album['Song'])) { ?>
		<dt>Listen</dt>
		<dd>
			<div id="jquery_jplayer" class="jp-jplayer"></div>
			<div id="jp_interface" class="jp-interface"><ul class="jp-controls"><li><a href="#" class="jp-play" tabindex="1">play</a></li><li><a href="#" class="jp-stop" tabindex="1">stop</a></li><li><div class="jp-progress"><div class="jp-seek-bar"><div class="jp-play-bar"></div></div></div></li><li><a href="#" class="jp-lower" tabindex="1">vol down</a></li><li><div class="jp-volume-bar"><div class="jp-volume-bar-value"></div></div></li><li><a href="#" class="jp-higher" tabindex="1">vol up</a></li></ul></div>
			<dl class="tracks">
		<?php	foreach($album['Song'] as $song) { ?>
				<dt><?php echo str_pad($song['number'],2,'0',STR_PAD_LEFT); ?></dt>
				<dd><?php echo $this->Pixelpod->link_if(!empty($song['url']), $song['title'].'<span class="playing">PLAYING</span>', '/attachments/mp3/'.$song['url'], array('escape' => false)); ?></dd>
		<?php	} ?>
			</dl>
		</dd>
		<?php } ?>
		<dt>Info</dt>
		<?php echo $this->Pixelpod->makeEditable('dd', $album, 'music', 'Album', 'comments'); ?>
		<?php if (!empty($album['Album']['url'])) { ?>
		<dt>Visit</dt>
		<dd><?php echo $this->Html->link($album['Album']['url'], $album['Album']['url']); ?></dd>
		<?php } ?>
		<?php if (!empty($album['Album']['purchase_url'])) { ?>
		<dt>Buy</dt>
		<dd><?php echo $this->Html->link($album['Album']['purchase_url'], $album['Album']['purchase_url']); ?></dd>
		<?php } ?>
		<?php if (!empty($license)) { ?>
		<dt>License</dt>
		<dd><?php echo $license; ?></dd>
		<?php } ?>
	</dl>
<?php if (AuthComponent::user('id') != null) { ?>
	<a href="<?php echo $this->Html->url(array('action' => 'edit', $album['Album']['id'], $album['Album']['slug'])); ?>" class="wide-link">EDIT</a>
	<?php echo $this->Html->link('DELETE', array('action' => 'delete', $album['Album']['id'], $album['Album']['slug']), array('class' => 'wide-link'), 'Are you sure you want to delete this album?'); ?>
<?php } ?>
	<a class="wide-link back" href="<?php echo $this->Html->url(array('action' => 'index')); ?>"><span class="left-arrow">&laquo;</span>BACK</a>
</section>


