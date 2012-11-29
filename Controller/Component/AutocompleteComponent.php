<?php
class AutocompleteComponent extends Component {
    var $config = array(
        'model' => null,
        'allowed_fields' => array(),
    );

    function initialize($controller, $settings = array()) {
        $this->controller = $controller;
        $this->config = array_merge($this->config, $settings);
    }

    function find($field = null) {
        $this->layout = null;
        $fields = array();

        if (in_array($field, $this->config['allowed_fields'])) {
            if (!empty($field) AND !empty($this->controller->params['url']['term'])) {
                $term = $this->controller->params['url']['term'];
                eval('$model =& $this->controller->'.$this->config['model'].';');

                $models = $model->find('all', array(
                    'conditions' => array(
                        $this->config['model'].'.'.$field.' LIKE' => '%'.$term.'%',
                    ),
                    'fields' => 'DISTINCT '.$field,
                    'recursive' => -1,
                    'order' => $this->config['model'].'.'.$field
                ));

                foreach($models as $model) {
                    $fields[] = $model[$this->config['model']][$field];
                }
            }
        }

        $this->controller->set('items', $fields);
    }

}
