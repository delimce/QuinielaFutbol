<?php

use App\Base\View;
use App\Libs\ObjectDB;
use App\Libs\Security;

function _index()
{
    Security::sessionActive();
    $data['siteTitle'] = Security::getSessionVar("TITTLE") . 'Home';

    $roundID = Security::getSessionVar("RONDA");

    $db = new ObjectDB();
    $db->setTable("ronda");
    $db->getTableFields("ronda", "id = $roundID");
    $roundName = $db->getField("ronda");
    
    $data['body'][] = View::do_fetch(VIEW_PATH . 'main/index_view.php', array("ronda" => $roundName));
    View::do_dump(LAYOUT_PATH . 'layout.php', $data);
    $db->close();
}
