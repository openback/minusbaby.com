<?php
echo json_encode(
    array(
        'success' => true,
        'data' => $this->element('post', array('post' => $post)),
    )
);
