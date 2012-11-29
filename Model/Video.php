<?php
App::import('Vendor', 'Gdata', array('file' => 'loadGdata.php'));
/**
 * Video Model
 *
 */
class Video extends AppModel {

/**
 * Display field
 *
 * @var string
 */
	public $displayField = 'title';
	public $order = "sort_order asc";

/**
 * Validation rules
 *
 * @var array
 */
	public $validate = array(
		'sort_order' => array(
			'notempty' => array(
				'rule' => array('numeric'),
			),
		),
		'url' => array(
			'url' => array(
				'rule' => array('url'),
				'message' => 'Must be a valid Vimeo or YouTube URL',
				'required' => false
			)
		),
		'thumbnail_url' => array(
			'url' => array(
				'rule' => array('url'),
			),
		),
		'embed' => array(
			'notempty' => array(
				'rule' => array('notempty'),
			),
		),
		'slug' => array(
			'notempty' => array(
				'rule' => array('notempty'),
			),
		),
	);

	public function beforeSave($options) {
		if (isset($this->data['Video']['url'])) {
			if (preg_match('%(?:youtube\.com/(?:[^/]+/.+/|(?:v|e(?:mbed)?)/|.*[?&]v=)|youtu\.be/)([^"&?/ ]{11})%i', $this->data['Video']['url'], $match)) {
				$youtube_id = $match[1];

				$video = file_get_contents("http://youtube.com/get_video_info?video_id=".$youtube_id);
				parse_str($video, $video);

				if ($video['status'] == 'fail') {
					$this->invalidate('url', 'Youtube error: ' . $video['reason']);
					return false;
				}

				$this->data['Video']['thumbnail_url'] = 'http://img.youtube.com/vi/' . $youtube_id . '/0.jpg';
				$this->data['Video']['title'] = $video['title'];
				$this->data['Video']['embed'] = <<<EOV
		  <object width="720" height="405" data="http://www.youtube.com/v/$youtube_id&hl=en_US&fs=1&rel=0&color1=0x2b405b&color2=0x6b8ab6">
			<param name="movie" value="http://www.youtube.com/v/$youtube_id&hl=en_US&fs=1&rel=0&color1=0x2b405b&color2=0x6b8ab6" />
			<param name="allowFullScreen" value="true" />
			<param name="allowScriptAccess" value="always" />
			<param name="wmode" value="transparent" />
			<embed src="http://www.youtube.com/v/$youtube_id&hl=en_US&fs=1&rel=0&color1=0x2b405b&color2=0x6b8ab6" type="application/x-shockwave-flash" wmode="transparent" allowScriptAccess="always" width="720" height="405">
		  </object>
EOV;
			} elseif (strpos($this->data['Video']['url'], 'vimeo') !== false) {
				$vimeo_id = (int) substr(parse_url($this->data['Video']['url'], PHP_URL_PATH), 1);
				$video = unserialize(file_get_contents("http://vimeo.com/api/v2/video/$vimeo_id.php"));
				print_r($video);
				$this->data['Video']['thumbnail_url'] =  $video[0]['thumbnail_medium'];
				$this->data['Video']['title'] =  $video[0]['title'];
				$this->data['Video']['description'] =  $video[0]['description'];
				$this->data['Video']['embed'] = <<<EOV
		  <object width="720" height="405" data="http://vimeo.com/moogaloop.swf?clip_id=$vimeo_id&amp;server=vimeo.com&amp;show_title=0&amp;show_byline=0&amp;show_portrait=0&amp;color=342872&amp;fullscreen=1">
			<param name="movie" value="http://vimeo.com/moogaloop.swf?clip_id=$vimeo_id&amp;server=vimeo.com&amp;show_title=0&amp;show_byline=0&amp;show_portrait=0&amp;color=342872&amp;fullscreen=1" />
			<param name="allowFullScreen" value="true" />
			<param name="allowScriptAccess" value="always" />
			<param name="wmode" value="transparent" />
			<embed src="http://vimeo.com/moogaloop.swf?clip_id=$vimeo_id&amp;server=vimeo.com&amp;show_title=0&amp;show_byline=0&amp;show_portrait=0&amp;color=342872&amp;fullscreen=1" type="application/x-shockwave-flash" allowScriptAccess="always" width="720" height="405" wmode="transparent">
		  </object>
EOV;
			} else {
				$this->invalidate('url', 'Must be a valid Vimeo or YouTube URL');
				return false;
			}
		} else {
			if (!isset($this->data['Video']['id'])) {
				// No url, but also no id? Nooooo good
				$this->invalidate('url', 'Must be a valid Vimeo or YouTube URL');
				return false;
			}
		}

        $this->data['Video']['slug'] = Inflector::slug($this->data['Video']['title'], '-');

		return parent::beforeSave($options);
	}
}
