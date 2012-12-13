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
		<title><?php echo SITE_TITLE; ?> &bull; <?php echo $title_for_layout?></title>
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
			$this->Html->css('screen', null, array('media' => 'screen, projection', 'inline' => false));
			$this->Html->css('print', null, array('media' => 'print', 'inline' => false));
			$this->Html->css('custom-theme/jquery-ui-1.9.1.custom', null, array('inline' => false));
			// $this->Html->script('jquery.easing.1.3', false);
			// $this->Html->script('jquery.cookie', false);
			// $this->Html->script('jquery-1.8.3.min', array('block' => 'footJs'));
			$this->Html->script('http://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js', array('block' => 'footJs'));
			// $this->Html->script('jquery-ui-1.9.2.custom.min', array('block' => 'footJs'));
			// $this->Html->script('respond.min', array('block' => 'footJs'));

			if (AuthComponent::user('id') != null) {
				if (Configure::read('debug') != 0) {
					$this->Html->script('admin.min', array('block' => 'footJs'));
				} else {
					$this->Html->script('admin', array('block' => 'footJs'));
				}
				$this->Html->script('ckeditor/ckeditor', array('block' => 'footJs'));
			}

			if (Configure::read('debug') != 0) {
				$this->Html->script('application.min', array('block' => 'footJs'));
			} else {
				$this->Html->script('jquery-ui-1.9.2.custom.min', array('block' => 'footJs'));
				$this->Html->script('jquery.jplayer.min', array('block' => 'footJs'));
				$this->Html->script('jquery.tools.min', array('block' => 'footJs'));
				$this->Html->script('respond.min', array('block' => 'footJs'));
				$this->Html->script('compiled/jquery.monobombNavigation', array('block' => 'pageJs'));
				$this->Html->script('compiled/application', array('block' => 'footJs'));
			}

			echo $this->fetch('css');
			echo $this->html->script('modernizr.custom.46313.js', true);
		?>
	  </head>
	  <body>
		<?php /** We're not using this yet
		<div id="monobomb">
			<nav>
				<a class="label" href="http://monobomb.com"><span class="logo"></span>monobomb records</a>
				Artist:
				<div class="selector-wrapper">
					<div class="viewing">
						<span class="color"></span><?php echo DEFAULT_ARTIST; ?><span class="arrow"></span>
						<ul>
						<?php foreach($monobomb as $mArtist):
								if ($mArtist['name'] == DEFAULT_ARTIST) { continue; }
						?>
							<li><a href="<?php echo $mArtist['url']; ?>"><span class="<?php echo $mArtist['class']; ?> arrow"></span><?php echo $mArtist['name']; ?></a></li>
						<?php endforeach; ?>
						</ul>
					</div>
				</div>
			</nav>
		</div>
		 */ ?>
		<div class="wrapper">
			<nav class="main">
				<ul class="main-menu">
					<li class="main-logo"><a href="/"<?php if ($controller_name == 'news') echo ' class="current"'; ?>><?php echo $this->Html->image(NEWS_LOGO, array('width' => 64, 'height' => 11, 'alt' => DEFAULT_ARTIST)); ?></a></li>
					<?php
						foreach($menu as $menuItem) {
							if ($menuItem['controller'] == $controller_name) {
								$options = array('class' => 'current');
							} else {
								$options = null;
							}

							echo $this->Html->tag('li', $this->Html->link($menuItem['name'], array('controller' => $menuItem['controller'], 'action' => 'index'), $options));
						}
					?>
					<?php if (AuthComponent::user('id') != null) { ?>
					<li class="logout"><?php echo $this->Html->link(__('Logout'), '/logout'); ?></li>
					<?php } ?>
				</ul>
			</nav>
			<?php echo $this->Session->flash(); ?>
			<?php echo $this->Session->flash('auth'); ?>
			<div class="content <?php echo $page_class; ?>">
				<?php echo $content_for_layout; ?>
			</div>
			<div id="push">&nbsp;</div>
		</div>
		<footer>
			<?php echo $this->Html->image(FOOTER_IMAGE, array('alt' => DEFAULT_ARTIST, 'class' => 'footer-logo')); ?>
			<span class="copy">This website and its content is licensed under a <a rel="license" href="http://creativecommons.org/licenses/by-nc-nd/3.0/">Creative Commons Attribution-Noncommercial-No Derivative Works 3.0 Unported License</a>.</span>
		</footer>
		<?php echo $this->fetch('footJs'); ?>
		<!--[if !IE]> -->
			<?php echo $this->Html->script('jquery.history'); ?>

		<!-- <![endif]-->

		<!--[if (gte IE 6)&(lte IE 8)]>
			<?php echo $this->Html->script('selectivizr-min'); ?>

		<![endif]-->
		<?php echo $this->fetch('pageJs'); ?>
	</body>
</html>
