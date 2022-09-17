<?php

namespace App\Base;

abstract class BaseController
{
    protected $controller_path = '../src/Bundle/controllers/'; //with trailing slash
    protected $web_folder = '/'; //with trailing slash
    protected $request_uri_parts = [];
    protected $controller;
    protected $action;
    protected $params = [];

    function __construct($controller_path, $web_folder, $default_controller, $default_action)
    {
        $this->controller_path = $controller_path;
        $this->web_folder = $web_folder;
        $this->controller = $default_controller;
        $this->action = $default_action;

        $this->explode_http_request()->parse_http_request()->route_request();
    }

    function explode_http_request()
    {
        $reqUri = $_SERVER['REQUEST_URI'];
        if (strpos($reqUri, $this->web_folder) === 0) {
            $reqUri = substr($reqUri, strlen($this->web_folder));
        }
        $this->request_uri_parts = $reqUri ? explode('/', $reqUri) : array();
        return $this;
    }

    //This function parses the HTTP request to get the controller name, action name and parameter array.
    function parse_http_request()
    {
        $this->params = [];
        $p = $this->request_uri_parts;
        if (isset($p[0]) && $p[0] && $p[0][0] != '?') {
            $this->controller = $p[0];
        }
        if (isset($p[1]) && $p[1] && $p[1][0] != '?') {
            $this->action = $p[1];
        }
        if (isset($p[2])) {
            $this->params = array_slice($p, 2);
        }
        return $this;
    }

    //This function maps the controller name and action name to the file location of the .php file to include
    function route_request()
    {
        $controllerFile =  $this->controller_path . $this->controller . '/' . $this->action . '.php';

        if (!preg_match('#^[A-Za-z0-9_-]+$#', $this->controller) || !file_exists($controllerFile)) {
            $this->request_not_found('Controller file not found: ' . $controllerFile);
        }
        $function = '_' . $this->action;
        if (!preg_match('#^[A-Za-z_][A-Za-z0-9_-]*$#', $function) || function_exists($function)) {
            $this->request_not_found('Invalid function name: ' . $function);
        }
        require($controllerFile);
        if (!function_exists($function)) {
            $this->request_not_found('Function not found: ' . $function);
        }
        call_user_func_array($function, $this->params);
        return $this;
    }

    /**
     * Override this function for your own custom 404 page
     * @param string $msg 
     * @return never 
     */
    function request_not_found($msg = '')
    {
        header("HTTP/1.0 404 Not Found");
        die('<html><head><title>Uppss!! Not Found </title></head><body><h1>Uppss, no Way! </h1><p>' . $msg . '<p>The requested URL was not found on this server.</p><p>Please go <a href="javascript: history.back(1)">back</a> and try again.</p><hr /><p>Avalon Framework is Powered By: <a href="http://delimce.com">delimce</a></p></body></html>');
    }
}
