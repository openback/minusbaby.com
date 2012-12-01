<nav class="networks">
	<h1>Other Networks</h1>
	<ul>
		<?php foreach ($sites as $site) { ?>
		<li><?php echo $this->Html->link($site['Site']['name'], $site['Site']['url']); ?></li>
		<?php } ?>
	</ul>
	<?php if (AuthComponent::user('id') !== null): ?><a href="<?php echo Router::url(array('controller' => 'sites')); ?>" class="wide-link">MANAGE</a><?php endif; ?>
</nav>
<nav class="individually">
	<h1>Or&hellip;</h1>
	<ul>
		<?php foreach ($artists as $artist) { ?>
		<li><a href="<?php echo $artist['Artist']['email']; ?>"><span class="name"><?php echo $artist['Artist']['name']; ?></span><span class="address"><?php echo $artist['Artist']['email']; ?></span></a></li>
		<?php } ?>
	</ul>
	<?php if (AuthComponent::user('id') !== null): ?><a href="<?php echo Router::url(array('controller' => 'artists')); ?>" class="wide-link">MANAGE</a><?php endif; ?>
</nav>
<section>
	<?php echo $this->Form->create('Contact'); ?>
		<?php echo $this->Form->input('name', array('label'=>'NAME')); ?>
		<?php echo $this->Form->input('email', array('label'=>'EMAIL')); ?>
		<?php echo $this->Form->input('subject', array('label'=>'SUBJECT')); ?>
		<?php echo $this->Form->input('body', array('cols'=>'130', 'rows'=>'24', 'label'=> 'MESSAGE', 'placeholder'=>"What's up?")); ?>
		<?php echo $this->Form->input('captcha',
				array(
					'label' => $this->Html->tag('span', "Are you human? Let's do some math. ")
						.$this->Html->tag('strong', $captcha.' = '),
					'placeholder' => '?',
					'div' => array(
						'id' => 'captcha',
					)
				)
			); ?>
		<?php echo $this->Form->button('SEND', array('type' => 'submit', 'name' => 'submit'));; ?>
	<?php echo $this->Form->end(); ?>
</section>
