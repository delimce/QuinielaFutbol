<?php

use App\Base\View;
use App\Libs\Security;

function _reglas() {

     Security::sessionActive();

    $data['siteTitle'] = $_ENV['APP_NAME'] . ' Reglas para jugar';
    $data['body'][] = View::do_fetch(VIEW_PATH . 'play/rules.php');
    View::do_dump(LAYOUT_PATH . 'layout.php', $data);
}