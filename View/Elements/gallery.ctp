          <article class="text_block gallery">
            <section class="scrollable">
              <div class="items">
<?php $div_closed = true;
      for ($i = 0; $i < count($photos); $i++) {
        if (($i % 12) == 0) {
          echo "<div>\n";
          $div_closed = false;
        }

        echo $this->Html->link($this->Html->image($photos[$i]['thumbnail'], array('alt' => 'Photo')), $photos[$i]['url_o'], array('escape' => false));

        if ((($i + 1)%12) == 0) {
          echo "</div>\n";
          $div_closed = true;
        }
      }

      if (!$div_closed) { echo "</div>\n"; }
?>
              </div>
            </section>
            <nav><a class="next">&nbsp;</a><a class="prev">&nbsp;</a></nav>
          </article>

