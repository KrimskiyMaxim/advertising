<?php

class Router
{
    private $routes;

    public function __construct()
    {
        $this->routes = require(ROOT.'/kernel/routes.php');
    }
    public function start()
    {
        $URI = parse_url($_SERVER['REQUEST_URI']);
        $URI = $this->createRoot(trim($URI['path'], '/'));

        foreach ($this->routes as $key => $item) {
            if ($URI == $key) {
                $success = true;
                $ControllerName = $item[0];
                $ActionName = 'action'.ucfirst($item[1]);
                $Access = $item[2];

                if ((empty($_SESSION[SESSION_BRANCH][AUTH_DATA]) && $Access == 'session')){
                    header('Location: '.NO_AUTH_LOCATION);
                } elseif (isset($_SESSION[SESSION_BRANCH][AUTH_DATA]) && $Access == 'no_session') {
                    header('Location: '.AUTH_LOCATION);
                } else {
                    $this->includeController($ControllerName, $ActionName);
                }

            }
        }
        if (empty($success)) {
            $begin = new project\controllers\error;
            $begin->actionError404();
        }
    }
    public function includeController($controller, $action)
    {
        $controller = 'project\\controllers\\'.$controller;
        $begin = new $controller;
        $begin->$action();
    }
    public function createRoot($URI)
    {
        $site_root = trim(str_replace("index.php", "", $_SERVER["PHP_SELF"]), "/");
        return trim(str_replace($site_root, '', $URI), "/");
    }
}
