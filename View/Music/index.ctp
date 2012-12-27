<?php
	$no_albums = true;

	if (!empty($lps)) {
		echo $this->element('album_list', array('title' => 'Albums', 'class' => 'lps', 'albums' => $lps));
		$no_albums = false;
	}

	if (!empty($eps)) {
		echo $this->element('album_list', array('title' => 'Singles &amp; EPs', 'class' => 'eps', 'albums' => $eps));
		$no_albums = false;
	}

	if (!empty($compilations)) {
		echo $this->element('album_list', array('title' => 'Compilations', 'class' => 'compilations', 'albums' => $compilations));
		$no_albums = false;
	}

	if (!empty($appears_on)) {
		echo $this->element('album_list', array('title' => 'Appears On', 'class' => 'appears-on', 'albums' => $appears_on));
		$no_albums = false;
	}

	if ($no_albums) {
?>
	Sorry, there aren&apos;t any albums listed yet.
<?php
	}

	if ($this->Session->check('Auth.User')) {
		if ($no_albums) {
?>
Why don't you <a href="<?php echo Router::url(array('action' => 'add')); ?>">add one</a>?
		<?php } else { ?>
		<a href="<?php echo Router::url(array('action' => 'add')); ?>" class="wide-link">ADD ALBUM</a>
<?php
		}
	}
?>
