<?php
foreach ($posts as $post)
    echo $this->element('post', array('post'=>$post));

if ($this->Paginator->hasNext())
	echo $this->Paginator->next('LOAD MORE POSTS', array('tag' => false, 'class' => 'more-posts wide-link'));
