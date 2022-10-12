<?php

use App\Base\View;
use App\Libs\FactoryDao;
use App\Libs\Front;
use App\Libs\ObjectDB;
use App\Libs\Security;

function _nuevo() {

     if(Security::isSessionActive()){
         Front::redirect ("main/index");
     }

     $db = new ObjectDB();
     $db->simpleQuery(FactoryDao::getGroups());

     $siteKey = $_ENV['RECAPTCHA_SITE_KEY'];

     $urls = [
        "index" => $_ENV['BASE_URL'] . "main/index",
        "login" => $_ENV['BASE_URL'] . "main/login",
        "save"  => $_ENV['BASE_URL'] . "registro/save",
     ];
    
    $data['siteTitle'] = $_ENV['APP_NAME'] . ' Registro de Usuario';
    $data['body'][] = View::do_fetch(VIEW_PATH . 'main/register.php',['urls' => $urls, "groups" => $db, "siteKey" => $siteKey]);
    View::do_dump(LAYOUT_PATH . 'loginLayout.php', $data);
}