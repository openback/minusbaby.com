          <article class="text_block library">
            <section class="information">
              <div class="details">
                <h2><?php echo $library['Library']['title']; ?></h2>
                <dl>
                  <dt><span>CLIENT</span></dt><dd><?php echo $this->Html->link($library['Library']['client'], $library['Library']['client_url']); ?></dd>

                  <dt><span>DUTIES</span></dt><dd><?php echo $library['Library']['duties'] ?></dd>
                </dl>
                <label class="permalink" for="permalink<?php echo $library['Library']['id']; ?>">&nbsp;</label><input type="text" class="permalink" id="permalink<?php echo $library['Library']['id']; ?>" value="<?php echo $this->Html->url(array('action'=>'view', $library['Library']['id'], $library['Library']['slug']), true); ?>" disabled />
<?php
if ($this->Session->check('Auth.User')) {
    echo $this->Html->div('block_row admin',
        $this->Html->link('EDIT', array('action' => 'edit', $library['Library']['id']))
        .$this->Html->link('DELETE',
            array('action' => 'delete', $library['Library']['id']),
            null,
            'Are you sure you want to delete this gallery?'
        )
    );
}
?>
              </div>
              <div class="summary">
                <?php echo $library['Library']['description'] ?>

              </div>
            </section>

            <section class="scrollable">
              <div class="items">
<?php
$div_closed = true;
$upper_bound = ceil(count($library['Book']) / 8) * 8;

for ($i = 0; $i < $upper_bound; $i++) {
    if (($i % 8) == 0) {
        // start the current page
        echo "<div>\n";
        $div_closed = false;
    }

    if (isset($library['Book'][$i])) {
        $book = $library['Book'][$i];
        $delete_link = $this->Pixelpod->link_only_if($this->Session->check('Auth.User'),
            'DELETE IMAGE', '/books/delete/'.$this->Session->id().'/'.$book['id'], array('class' => 'deleteImage'));

        echo $this->Html->div('item',
            $this->Html->link(
                $this->Html->image('/attachments/art/'.$library['Library']['id'].'/'.$book['thumb'],
                    array('class' => 'thumb')
                )
                .$this->Html->div('zoom', $this->Html->image('zoom_screen.png')),
                '/attachments/art/'.$library['Library']['id'].'/'.$book['full'],
                array('class' => 'book', 'escape' => false)
            )
            .$delete_link,
            array('rel' => $book['id'])
        );
    } else {
        echo $this->Html->div('item', $this->Html->image('gallery_empty_spot.png'));
    }


    if ((($i + 1)%8) == 0) {
        // end the current page
        echo "</div>\n";
        $div_closed = true;
    }
}
?>
              </div>
            </section>
            <nav><a class="next">&nbsp;</a><a class="prev">&nbsp;</a></nav>
          </article>
