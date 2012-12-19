<article class="text_block press_link">
    <section class="information">
<?php
if (!empty($link['image_file_path'])) {
    echo $this->Html->image('/attachments/press-links/original/'.$link['image_file_path']);
}
?>
        <h2>
<?php
echo $this->Pixelpod->link_if_url($link['site'], $link['site_url'], array('target' => '_blank'));
?></h2>
<?php
if (!empty($link['article_url'])) {
    echo '<hr />'.$this->Html->div('block_row', $this->Html->link('IN SITU', $link['article_url'], array('target' => '_blank')));
}

if (($this->action != 'preview') AND $this->Session->check('Auth.User')) {
    echo '<hr />'.$this->Html->div('block_row admin',
        $this->Html->link('EDIT', array('controller' => 'pressLinks', 'action' => 'edit', $link['id']))
        .$this->Html->link('DELETE', array('controller' => 'pressLinks', 'action' => 'delete', $link['id']), null, 'Are you sure you want to delete this Press Article?')
    );
}
?>
    </section>
    <section class="main">
        <h1>&#8220;<span class="title"><?php echo $link['article_title']; ?></span>&#8221;
<?php
if (!empty($link['author'])) {
    echo 'by '.$this->Html->tag('span',
        $this->Pixelpod->link_if_url($link['author'], $link['author_url'], array('target' => '_blank')),
        array('class' => 'author'));
}
?>
        </h1>
        <?php echo $link['article']; ?>
    </section>
</article>
