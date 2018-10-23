<?php

namespace project\controllers;

use project\kernel\system\Controller;

class Error extends Controller
{
    public function actionError404()
    {
        http_response_code(404);
        $this->view('404');
    }
}
