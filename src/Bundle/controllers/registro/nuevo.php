<?php

use App\Base\View;
use App\Libs\Front;
use App\Libs\Security;

function _nuevo() {

     if(Security::isSessionActive()){
         Front::redirect ("main/index");
     }
    
    $data['siteTitle'] = Security::getSessionVar("TITTLE") . 'Registro de Usuario';
    $data['body'][] = View::do_fetch(VIEW_PATH . 'main/registro.php');
    View::do_dump(LAYOUT_PATH . 'layoutRegister.php', $data);
}