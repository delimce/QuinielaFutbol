<?php

namespace App\Base;

class View extends BaseView {

    //Example of overriding a constructor/method, add some code then pass control back to parent
    function __construct($file='',$vars='') {
      $file = VIEW_PATH.$file;
      return parent::__construct($file,$vars);
    }

}

