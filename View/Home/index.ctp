<!DOCTYPE html>
<html lang="en" class="no-js">
<?php
	// A little set up
	if (!isset($page_class)) {
		$page_class = $this->request->params['controller'];
	}
?>
	<head>
		<meta charset="UTF-8">
		<?php echo $this->Html->charset(); ?>
		<title><?php echo SITE_TITLE; ?></title>
		<meta name="description" content="">
		<meta name="author" content="Richard Caraballo,Timothy Caraballo">
		<meta name="keywords" content="<?php echo DEFAULT_ARTIST; ?>,monobomb,chiptune,music,label,chipmusic,xix">
		<meta name="generator"  content="vim 7.3.125">
		<meta name="dcterms.language"   content="en-US">
		<meta name="dcterms.license"  content="http://creativecommons.org/licenses/by-nc-nd/3.0/">
		<meta name="designer"   content="Richard Alexander Caraballo">
		<meta name="viewport" content="width=device-width">
		<?php echo $this->Html->meta('icon'); ?>

		<!--[if lt IE 9]>
			<script src="http://html5shiv.googlecode.com/svn/trunk/html5.js"></script>

		<![endif]-->
		<?php
			if (Configure::read('debug') == 0) {
				$this->Html->css('min/screen', null, array('media' => 'screen, projection', 'inline' => false));
				$this->Html->css('min/print', null, array('media' => 'print', 'inline' => false));
			} else {
				$this->Html->css('screen', null, array('media' => 'screen, projection', 'inline' => false));
				$this->Html->css('print', null, array('media' => 'print', 'inline' => false));
			}

			$this->Html->css('custom-theme/jquery-ui-1.9.1.custom', null, array('inline' => false));

			echo $this->fetch('css');
		?>
	</head>
	<body class="landing-page">
		<div class="wrapper">
			<?php echo $this->Session->flash(); ?>
			<?php echo $this->Session->flash('auth'); ?>
			<div class="content">
				<a href="<?php echo $this->Html->url(array('controller' => 'news')); ?>" id="music">
					<h1>Music</h1>
					<h2>minusbaby</h2>
					<p>News, Info, Releases & Events</p>
				</a>
				<a href="/portfolio" id="portfolio">
					<h1>Portfolio</h1>
					<h2>Richard Alexander Caraballo</h2>
					<p>Selected Pixel Art Works <i>1492-2012</i>
					</p>
				</a>
			</div>
		</div>
	</body>
</html>
