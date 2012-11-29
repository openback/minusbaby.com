<?php
foreach ($posts as $post) {
    echo $this->element('post', array('post'=>$post));
}
?>
<?php
if (!empty($paginator) && $paginator->hasNext()) {
    echo $this->Html->div('block_row paging',
        $paginator->next('LOAD MORE POSTS', null, null, array('class' => 'disabled'))
    );
};
?>
