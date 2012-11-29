<?php
class Song extends AppModel {
    var $name = 'Song';
    var $belongsTo = array( 'Album');
    var $validate = array(
        'number' => array(
            'rule' => 'numeric',
            'required' => true,
        ),
        'title' => array(
            'rule' => 'notEmpty',
            'required' => true,
        ),
        /* Does not work correctly :(
        'length' => array(
            'rule' => '/^\d+:\d{2}$/',
            'allowEmpty' => true,
            'required' => false,
        ),
         */
    );
    private $_tmp_filename;

    function beforeDelete($cascade = true) {
        $this->_tmp_filename = $this->read('url');
        return true;
    }

    function afterDelete() {
        $file = WWW_ROOT.'attachments'.DS.'mp3'.DS.$this->_tmp_filename['Song']['url'];

		if (is_file($file)) {
				unlink($file);
		}
    }
}
?>
