<?php
class Post extends AppModel {
    public $name = 'Post';
	public $actsAs = array(
		'Utility.Sluggable'
	);
    public $validate = array(
        'title' => array(
            'rule' => 'notEmpty',
            'required' => true,
            'allowEmpty' => false,
        ),
        'date' => array(
            'rule' => 'date',
            'allowEmpty' => false,
        ),
        'embed' => array(
            'rule' => 'imageOrEmbed',
            'message' => 'You must include an image or embed text.',
        ),
    );
	public $order = 'Post.date DESC';

	public $findMethods = array(
		'navList' => true
	);

	public function _findNavList($state, $query, $results = array()) {
		if ($state == 'before') {
			$query['fields'] = array('id', 'title', 'slug', 'date');
			$query['sort'] = 'Post.date DESC';
			return $query;
		}
		return $results;
	}

    function imageOrEmbed($data) {
        return (!empty($this->data['Post']['post_file_name']) OR
                !empty($this->data['Post']['embed']));
    }

    function beforeValidate($options = array()) {
        $options = array_merge(array('ignore_image' => false), $options);

        // This is useful for previews
        if ($options['ignore_image']) {
            unset($this->validate['embed']);
        }

        return true;
    }
}
