<?php

function _reglas() {

     Security::sessionActive();

    
    $data['siteTitle'] = Security::getSessionVar("TITTLE") . 'Reglas para jugar';
    $data['body'][] = View::do_fetch(VIEW_PATH . 'play/rules.php');
    View::do_dump(LAYOUT_PATH . 'layout.php', $data);
}