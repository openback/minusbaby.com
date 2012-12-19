<?php
class AppError extends ErrorHandler {
    var $name = 'Error';
    var $codes = array(
        200 => 'OK',
        400 => 'Bad Request',
        401 => 'Unauthorized',
        402 => 'Payment Required',
        403 => 'Forbidden',
        404 => 'Not Found',
        405 => 'Method Not Allowed',
        406 => 'Not Acceptable',
        407 => 'Proxy Authentication Required',
        408 => 'Request Time-out',
        500 => 'Internal Server Error',
        501 => 'Not Implemented',
        502 => 'Bad Gateway',
        503 => 'Service Unavailable',
        504 => 'Gateway Time-out'
    );

    function error404($params) {
        $this->error(array('code' => 404, 'message' => 'Not found'));
    }

    function error($params) {
        extract($params, EXTR_OVERWRITE);

        $name = (isset($name)) ? $name : $this->codes[$code];
        $url  = (isset($url))  ? $url  : $this->controller->here;
        $viewPath = APP::path('views');
        $viewPath = $viewPath[0];

        // set header
        header("HTTP/1.x $code $name");

        $this->controller->set(array(
            'code' => $code,
            'name' => $name,
            'message' => $message,
            'title' => $code . ' ' . $name,
            'request' => $url
        ));

        if ($this->controller->RequestHandler->isXml()) {
            $this->controller->RequestHandler->renderAs($this->controller, 'xml');
        }

        $this->log('ERROR: '.$code.' : '.$url.' '.$message);

        if (file_exists($viewPath.'errors'.DS.$code.'.ctp')) {
            $this->_outputMessage($code);
        } else {
            $this->_outputMessage('error');
        }
    }

    function beforeFilter() {
        parent::beforeFilter();
    }
}
