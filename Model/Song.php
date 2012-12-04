<?php
class Song extends AppModel {
    public $name = 'Song';
    public $belongsTo = array( 'Album');
    public $validate = array(
        'number' => array(
            'rule' => 'numeric',
        ),
        'title' => array(
            'rule' => 'notEmpty',
        ),
    );
    private $_tmp_filename;

    public function beforeDelete($cascade = true) {
        $this->_tmp_filename = $this->read('url');
        return true;
    }

    public function afterDelete() {
        $file = WWW_ROOT.'attachments'.DS.'mp3'.DS.$this->_tmp_filename['Song']['url'];

		if (is_file($file))
			unlink($file);
    }
}
?>
