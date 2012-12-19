<?php
class Venue extends AppModel {
    public $name = 'Venue';
    public $hasMany = array(
        'Event' => array(
			'dependent' => true,
			'counterCache' => true
        ),
    );
	public $validate = array(
		'name' => array(
			'rule' => 'notEmpty',
			'message' => 'This field cannot be left blank.'
		)
	);

	public $order = 'Venue.name ASC';

    function beforeSave() {
        parent::beforeSave();

		// TODO: Make address one field
        // If we have an address, make a Google map link
        if (empty($this->data['Venue']['address1']))
			return true;

		$address = $this->data['Venue']['name'].','.$this->data['Venue']['address1'].',';

		if (!empty($this->data['Venue']['address2']))
			$address .= $this->data['Venue']['address2'].',';

		$address .= $this->data['Venue']['city'].',';

		if (!empty($this->data['Venue']['state']))
			$address .= $this->data['Venue']['state'].',';

		$address .= $this->data['Venue']['country'];

		$mapurl = 'http://maps.google.com/?q='.urlencode($address);
		// I want pluses and commas
		$mapurl = str_replace('%2F', '+', $mapurl);
		$mapurl = str_replace('%2C', ',', $mapurl);

		$c = curl_init();
		curl_setopt_array($c,
			array(
				CURLOPT_URL => 'https://www.googleapis.com/urlshortener/v1/url',
				CURLOPT_HEADER => false,
				CURLOPT_HTTPHEADER => array('Content-Type: application/json'),
				CURLOPT_POST => true,
				CURLOPT_POSTFIELDS => json_encode(array('longUrl' => $mapurl)),
				CURLOPT_RETURNTRANSFER => true
			)
		);

		if ($res = curl_exec($c)) {
			$json = json_decode($res);
			$this->data['Venue']['map'] = isset($json->id) ? $json->id : $mapurl;
		} else {
			// we couldn't get the short url :(
			$this->data['Venue']['map'] = $mapurl;
		}

        return true;
    }
}
?>
