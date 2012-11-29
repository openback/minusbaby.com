<?php
class Contact extends AppModel {
  public $useTable = false;
  protected $_schema = array(
      'name'  =>array('type'=>'string', 'length'=>100),
      'email' =>array('type'=>'string', 'length'=>255),
      'body'  =>array('type'=>'text')
  );

  public $validate = array(
    'name' => array('rule'=>array('minLength', 3), 'message'=>'Name is required' ),
    'email' => array('rule'=>'email', 'message'=>'Must be a valid email address' ),
    'body' => array('rule'=>'notEmpty', 'message'=>'Body is required' )
  );
}
?>
