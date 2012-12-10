<?php
App::uses('CakeEmail', 'Network/Email');

class ContactController extends AppController {
    public $name = 'Contact';
	public $uses = array('Artist', 'Contact', 'Site');
    public $components = array(
        'MathCaptcha' => array(
            'maxnumber' => 10,
        ),
    );

    function index() {
        if ($this->request->is('post')) {
            $this->Contact->set($this->request->data);

			if ($this->MathCaptcha->validates($this->request->data['Contact']['captcha'])) {
				if ($this->Contact->validates()) {
					$email = new CakeEmail('mailer');
                    $email->replyTo(array($this->request->data['Contact']['email'] => $this->request->data['Contact']['name']));
					$email->subject($this->request->data['Contact']['subject']);
					$body_pre = "The following was sent from the " . DEFAULT_ARTIST . ".com contact form:\n";

					try {
						if ($email->send($body_pre . $this->request->data['Contact']['body'])) {
							$this->Session->setFlash('Thanks for your email!', 'flash_success');
						} else {
							$this->data['Contact']['captcha'] = null;
							$this->Session->setFlash('There was a problem sending your email. Please try again later.', 'flash_failure');
						}
					} catch (Exception $e) {
						$this->log($e->getMessage() ."\n" . $e->getTraceAsString());
						$this->Session->setFlash('There was a problem sending your email. Please try again later.', 'flash_failure');
					}
				} else {
					$this->request->data['Contact']['captcha'] = null;
					$this->Session->setFlash('There was a problem with the form.', 'flash_failure');
				}
			} else {
				$this->Session->setFlash('There was a problem with your input.', 'flash_failure');
				$this->Contact->invalidate('captcha', 'Sorry, your math was wrong.');
				// Validate the rest anyway
				$this->Contact->validates();
				$this->request->data['Contact']['captcha'] = null;
			}
        }

        // Set up our math captcha
        $captcha = str_replace('+', '(+)', $this->MathCaptcha->generateEquation());

		$this->set('sites', $this->Site->find('all'));
		$this->set('artists', $this->Artist->find('forContact'));
        $this->set('captcha', $captcha);
    }

    function beforeFilter() {
        parent::beforeFilter();
        $this->set('controller_name','contact');
    }
}
?>
