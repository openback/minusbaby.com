<?php
class Album extends AppModel {
    var $name = 'Album';
    var $hasMany = array(
        'Song' => array(
            'className' => 'Song',
            'foreignKey' => 'album_id',
            'dependent' => true,
            'order' => 'number ASC',
        )
    );
	var $actsAs = array(
		'Utility.Sluggable'
	);
    var $validate = array(
        'title' => array(
            'rule' => 'notEmpty',
            'required' => true,
        ),
        'artist' => array(
            'rule' => 'notEmpty',
            'required' => true,
        ),
        'release_date' => array(
            'rule' => 'date',
            'required' => true,
        ),
        'formats' => array(
            'rule' => 'notEmpty',
            'required' => true,
        ),
    );

	public $order = 'Album.release_date DESC';

	public $findMethods = array(
		'ep' => true,
		'lp' => true,
		'compilation' => true,
		'appearsOn' => true
	);

    function _findLp($state, $query, $results = array()) {
		return $this->_findType('LP', $state, $query, $results);
    }

    function _findEp($state, $query, $results = array()) {
		return $this->_findType('EP', $state, $query, $results);
    }

    function _findAppearsOn($state, $query, $results = array()) {
		return $this->_findType('Appears on', $state, $query, $results);
    }

    function _findCompilation($state, $query, $results = array()) {
		return $this->_findType('Compilation', $state, $query, $results);
    }

	private function _findType($type, $state, $query, $results = array()) {
		if ($state == 'before') {
			$query['conditions']['Album.type'] = $type;
			return $query;
		}
		return $results;
	}

	public function afterFind(array $results, $primary = false) {
		foreach ($results as $key => $val) {
			if (empty($val['Album']['thumbnail_file_path'])) {
				$results[$key]['Album']['thumbnail_url'] = 'no_album_cover.png';
			} else {
				$results[$key]['Album']['thumbnail_url'] = '/attachments/album-covers/original/'.$val['Album']['thumbnail_file_path'];
			}

			if (empty($val['Album']['cover_file_path'])) {
				$results[$key]['Album']['cover_url'] = 'no_album_cover.png';
			} else {
				$results[$key]['Album']['cover_url'] = '/attachments/album-covers/original/'.$val['Album']['cover_file_path'];
			}

		}

		return $results;
	}

    public function beforeValidate($options = array()) {
        parent::beforeValidate($options);

        // Set our artist if needed
        if (empty($this->data['Album']['artist'])) {
            if ($this->data['Album']['type'] == 'Solo') {
                $this->data['Album']['artist'] = 'minusbaby';
            } else {
                $this->data['Album']['artist'] = 'Various Artists';
            }
        }

        // optional url validation is always buggy for me, so this is the fix
        $url_validation = array(
        'rule' => 'url',
            'required' => true,
            'message' => 'This must be a valid URL',
        );

        $url_fields = array('label_url', 'purchase_url', 'url');

        foreach($url_fields as $field) {
            if (!empty($this->data['Album'][$field])) {
                $this->validate[$field] = $url_validation;
            }
        }

        return true;
    }
}
?>
