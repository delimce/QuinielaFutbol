<?php

namespace App\Base;

//===============================================================
// View
// For plain .php templates
//===============================================================
abstract class BaseView
{
  protected $file = '';
  protected $vars = [];

  function __construct($file = '', $vars = '')
  {
    if ($file) {
      $this->file = $file;
    }
    if (is_array($vars)) {
      $this->vars = $vars;
    }
    return $this;
  }

  function __set($key, $var)
  {
    return $this->set($key, $var);
  }

  function set($key, $var)
  {
    $this->vars[$key] = $var;
    return $this;
  }

  //for adding to an array
  function add($key, $var)
  {
    $this->vars[$key][] = $var;
  }

  function fetch($vars = '')
  {
    if (is_array($vars)) {
      $this->vars = array_merge($this->vars, $vars);
    }
    extract($this->vars);
    ob_start();
    require($this->file);
    return ob_get_clean();
  }

  function dump($vars = '')
  {
    if (is_array($vars)) {
      $this->vars = array_merge($this->vars, $vars);
    }
    extract($this->vars);
    require($this->file);
  }

  static function do_fetch($file = '', $vars = '')
  {
    if (is_array($vars)) {
      extract($vars);
    }
    ob_start();
    require($file);
    return ob_get_clean();
  }

  static function do_dump($file = '', $vars = '')
  {
    if (is_array($vars)) {
      extract($vars);
    }
    require($file);
  }

  static function do_fetch_str($str, $vars = '')
  {
    if (is_array($vars)) {
      extract($vars);
    }
    ob_start();
    eval('?>' . $str);
    return ob_get_clean();
  }

  static function do_dump_str($str, $vars = '')
  {
    if (is_array($vars)) {
      extract($vars);
    }
    eval('?>' . $str);
  }
}
