<?php
namespace App\Base;

use App\Base\BaseController;

//===============================================================
// Controller
//===============================================================
class Controller extends BaseController {

  //Example of overriding a core class method with your own
  /*
  function request_not_found() {
    die(View::do_fetch(VIEW_PATH.'errors/404.php'));
  }
  
  */
}