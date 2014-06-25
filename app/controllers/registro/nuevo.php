<?php

function _nuevo() {

    ////ya estoy logueado
     if(Security::isSessionActive())
         Front::redirect ("main/index");
    
    $data['siteTitle'] = Security::getSessionVar("TITTLE") . 'Registro de Usuario';
    $data['body'][] = View::do_fetch(VIEW_PATH . 'main/registro.php');
    View::do_dump(LAYOUT_PATH . 'layoutRegister.php', $data);
}