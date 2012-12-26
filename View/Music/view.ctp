<?php
	// Should I set width to 450 here?
	$cover = $this->Html->image($album['Album']['cover_url'], array('class'=>'cover', 'alt' => $album['Album']['title'].' cover', 'width' => 461));

	/* LICENSE */
	$license = $album['Album']['license'];

	if (strtolower($license) == 'cc') {
		$license = $this->Html->link(
			$this->Html->image('cc.png', array('alt' => 'Creative Commons')),
			'http://creativecommons.org/licenses/by-nc-nd/3.0/',
			array('target' => '_blank', 'escape' => false)
		);
	}

	$has_stream = false;

	if (!empty($album['Song'])) {
		foreach($album['Song'] as $song) {
			if (!empty($song['url'])) {
				$has_stream = true;
				break;
			}
		}
	}
?>
<div class="images"><?php echo $cover; ?></div>
<!-- <nav class="images"><a class="active" href="#">1</a><a href="#">2</a><a href="#">3</a></nav> -->
<section class="details">
	<dl>
		<dt>Title</dt>
		<dd><?php echo $album['Album']['title']; ?></dd>
		<dt>Year</dt>
		<dd><?php echo $this->Pixelpod->time($album['Album']['release_date']); ?></dd>
		<dt>Artist</dt>
		<dd><?php echo $album['Album']['artist']; ?></dd>
		<dt>Label</dt>
		<dd><?php echo $this->Pixelpod->link_if(!empty($album['Album']['label_url']), $album['Album']['label'], $album['Album']['label_url'], array('escape' => false)); ?></dd>
		<?php if (count($album['Song'])) { ?>
		<dt><?php echo ($has_stream)? 'Listen' : 'TRACKS'; ?></dt>
		<dd>
			<?php if ($has_stream) { ?>
			<div id="jquery_jplayer" class="jp-jplayer"></div>
			<div id="jp_interface" class="jp-interface"><ul class="jp-controls"><li><a href="#" class="jp-play" tabindex="1">play</a></li><li><a href="#" class="jp-stop" tabindex="1">stop</a></li><li><div class="jp-progress"><div class="jp-seek-bar"><div class="jp-play-bar"></div></div></div></li><li><a href="#" class="jp-lower" tabindex="1">vol down</a></li><li><div class="jp-volume-bar"><div class="jp-volume-bar-value"></div></div></li><li><a href="#" class="jp-higher" tabindex="1">vol up</a></li></ul></div>
			<?php } ?>
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


