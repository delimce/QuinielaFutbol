<?php

use App\Base\View;
use App\Libs\Front;
use App\Libs\Security;

function _nuevo() {

     if(Security::isSessionActive()){
         Front::redirect ("main/index");
     }

     $urls = [
        "index" => $_ENV['BASE_URL'] . "main/index",
        "login" => $_ENV['BASE_URL'] . "main/login",
        "save" => $_ENV['BASE_URL'] . "registro/save",
     ];
    
    $data['siteTitle'] = Security::getSessionVar("TITTLE") . 'Registro de Usuario';
    $data['body'][] = View::do_fetch(VIEW_PATH . 'main/register.php',['urls' => $urls]);
    View::do_dump(LAYOUT_PATH . 'loginLayout.php', $data);
}