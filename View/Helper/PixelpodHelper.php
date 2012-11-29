<?php
class PixelpodHelper extends AppHelper {
	var $helpers = array(
		'Form',
		'Html'
	);

    /**
     * Creates an HTML link if the $condition is true, otherwise it will simply
     * output $title.
     *
     * If $url starts with "http://" this is treated as an external link. Else,
     * it is treated as a path to controller/action and parsed with the
     * HtmlHelper::url() method.
     *
     * ### Options
     *
     * - `escape` Set to false to disable escaping of title and attributes.
     *
     * @param boolean $condition Condition to test for
     * @param string $title The content to be wrapped by <a> tags.
     * @param mixed $url Cake-relative URL or array of URL parameters, or external URL (starts with http://)
     * @param array $options Array of HTML attributes. If the condition fails and
     * a class is given, $title will be wrapped in a `<span />` element.
     * @param string $confirmMessage JavaScript confirmation message.
     * @return string Plain text or an `<a />` element.
     * @access public
     */
    function link_if($condition, $title, $url = null, $options = array(), $confirmMessage = false) {
        if ($condition) {
            return $this->Html->link($title, $url, $options, $confirmMessage);
        }

        if (array_key_exists('class', $options)) {
            unset($options['target']);
            return $this->Html->tag('span', $title, $options);
        }

        return $title;
    }

    /**
     * Creates an HTML link if the $condition parameter is true, otherwise
     * returns null.
     *
     * If $url starts with "http://" this is treated as an external link. Else,
     * it is treated as a path to controller/action and parsed with the
     * HtmlHelper::url() method.
     *
     * ### Options
     *
     * - `escape` Set to false to disable escaping of title and attributes.
     *
     * @param string $title The content to be wrapped by <a> tags.
     * @param mixed $url Cake-relative URL or array of URL parameters, or external URL (starts with http://)
     * @param array $options Array of HTML attributes. If the condition fails and
     * a class is given, $title will be wrapped in a `<span />` element.
     * @param string $confirmMessage JavaScript confirmation message.
     * @return string null or an `<a />` element.
     * @access public
     */
    function link_only_if($condition, $title, $url = null, $options = array(), $confirmMessage = false) {
        if (!$condition) {
            return null;
        }

        // Pass it through link_if() for processing.
        return $this->link_if(true, $title, $url, $options, $confirmMessage);
    }

    /**
     * Creates an HTML link if the $url parameter is not empty(), otherwise
     * it will simply output $title.
     *
     * If $url starts with "http://" this is treated as an external link. Else,
     * it is treated as a path to controller/action and parsed with the
     * HtmlHelper::url() method.
     *
     * ### Options
     *
     * - `escape` Set to false to disable escaping of title and attributes.
     *
     * @param string $title The content to be wrapped by <a> tags.
     * @param mixed $url Cake-relative URL or array of URL parameters, or external URL (starts with http://)
     * @param array $options Array of HTML attributes. If the condition fails and
     * a class is given, $title will be wrapped in a `<span />` element.
     * @param string $confirmMessage JavaScript confirmation message.
     * @return string Plain text, a `<span />`, or an `<a />` element.
     * @access public
     */
    function link_if_url($title, $url = null, $options = array(), $confirmMessage = false) {
        return $this->link_if(!empty($url), $title, $url, $options, $confirmMessage);
    }

    /**
     * Creates an HTML link if the $url parameter is not empty(), otherwise
     * returns null.
     *
     * If $url starts with "http://" this is treated as an external link. Else,
     * it is treated as a path to controller/action and parsed with the
     * HtmlHelper::url() method.
     *
     * ### Options
     *
     * - `escape` Set to false to disable escaping of title and attributes.
     *
     * @param string $title The content to be wrapped by <a> tags.
     * @param mixed $url Cake-relative URL or array of URL parameters, or external URL (starts with http://)
     * @param array $options Array of HTML attributes.
     * @param string $confirmMessage JavaScript confirmation message.
     * @return string null or an `<a />` element.
     * @access public
     */
    function link_only_if_url($title, $url = null, $options = array(), $confirmMessage = false) {
        if (empty($url)) {
            return null;
        }

        // Pass it through link_if() for processing.
        return $this->link_if(true, $title, $url, $options, $confirmMessage);
    }

    /**
     * Returns a formatted article tag.
     *
     * ### Options
     *
     * - `escape` Whether or not the contents should be html_entity escaped.
     *
     * @param string $class CSS class name of the article element.
     * @param string $text String content that will appear inside the article element.
     *   If null, only a start tag will be printed
     * @param array $options Additional HTML attributes of the article tag
     * @return string The formatted article element
     * @access public
     */
    function article($class = null, $text = null, $options = array()) {
        if (!empty($class)) {
            $options['class'] = $class;
        }

        return $this->Html->tag('article', $text, $options);
    }

    /**
     * Returns a formatted section tag.
     *
     * ### Options
     *
     * - `escape` Whether or not the contents should be html_entity escaped.
     *
     * @param string $class Optional CSS class name of the section element.
     * @param string $text String content that will appear inside the section element.
     *   If null, only a start tag will be printed
     * @param array $options Additional HTML attributes of the section tag
     * @return string The formatted section element
     * @access public
     */
    function section($class = null, $text = null, $options = array()) {
        if (!empty($class)) {
            $options['class'] = $class;
        }

        return $this->Html->tag('section', $text, $options);
    }

	function time($class, $time = null, $options = array()) {
		if (is_string($class) && !is_string($time)) {
			if (is_array($time)) {
				$options = $time;
			} else {
				$options = array();
			}

			$time = $class;
			$class = null;
		}

		if (!empty($class)) {
			$options['class'] = $class;
		}

		if ($time != null) {
			$options['datetime'] = $time;
			$date = strtotime($time);
			$time = date('Y F d', $date);
		}

		return $this->Html->tag('time', $time, $options);
	}

	function extractYear($time) {
		return date('Y', strtotime($time));
	}

	/**
	 * Creates an HTML element with specified options and added attributes to get
	 * CKEditor working.
     *
	 * @param array data The model object that contains the field to use as text.
	 * Must also contain an 'id' field.
	 * If the controller has the same name as the model, it may be omitted
     *
     * @access public
     */
	function makeEditable($tag, $data, $options, $controller, $model = null, $field = null) {
		if (!is_array($options)) {
			if ($model === null) {
				$field = $controller;
				$controller = $model = $options;
				$options = array();

			} else {
				$field = $model;
				$model = $controller;
				$controller = $options;
				$options = array();
			}
		} elseif ($field === null) {
			$field = $model;
			$model = $controller;
		}

		$model = ucfirst($model);
		$controller = lcfirst($controller);
		$form = null;

		if (AuthComponent::user('id') !== null) {
			$options = array_merge($options, array(
				'contentEditable' => 'true',
				'data-id' => $data[$model]['id'],
				'data-controller' => $controller,
				'data-field' => $field,
				'data-model' => $model
			));

			// Now we need a hidden form for the AJAX using security
			$form = $this->Form->create($model, array('class' => 'hidden'))
				.$this->Form->input('id', array('type' => 'text', 'label' => false, 'div' => false))
				.$this->Form->input($field, array('label' => false, 'div' => false))
				.$this->Form->end();

		}

		if (isset($options['label'])) {
			$options['data-label'] = $options['label'];
			unset($options['label']);
		}

		$content = empty($data[$model][$field]) ? '' : $data[$model][$field];

		return $this->Html->tag($tag, $content, $options) . $form;
	}

	public function monobombNavigation($main_nav_wrapper, $inner_nav_wrapper, $inner_elements, $controls_nav = '.pager', $visible_columns = 4) {
		$this->Html->script('compiled/jquery.monobombNavigation', array('block' => 'pageJs'));
		$this->Html->scriptBlock(
			'$(".content").monobombNavigator({'
				.'main_nav_wrapper: "'.$main_nav_wrapper.'",'
				.'inner_nav_wrapper: "'.$inner_nav_wrapper.'",'
				.'inner_elements: "'.$inner_elements.'",'
				.'controls_nav: "'.$controls_nav.'",'
				.'visible_columns: '.$visible_columns
			.'});', array('block' => 'pageJs')
		);
	}
}
