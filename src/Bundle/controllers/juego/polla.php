<?php

use App\Base\View;
use App\Libs\ObjectDB;
use App\Libs\Security;
use App\Libs\FactoryDao;

function _polla() {

    Security::sessionActive();
    $roundID = Security::getSessionVar("RONDA");
    $db = new ObjectDB();

    $db->setTable("ronda");
    $db->getTableFields("ronda", "id = $roundID");
    $roundName = $db->getField("ronda");

    $currentDate = date("d/m h:i:A");

    $db->setSql(FactoryDao::getMatches($roundID, Security::getUserID()));
    $db->executeQuery();

    $data['siteTitle'] = Security::getSessionVar("TITTLE") . 'Mi Quiniela';
    $data['body'][] = View::do_fetch(VIEW_PATH . 'play/form.php', array("partidos" => $db, "ronda" => $roundName, "fecha" => $currentDate));
    View::do_dump(LAYOUT_PATH . 'layout.php', $data);

    $db->close();
}

function diffTime($match) {

    $date1 = strtotime($match);
    return intval(floor(($date1 - time()) / 3600));
}

//valida si hay tiempo para apostar (minimo 3 horas antes de empezar)
function isInTime($match) {
    return (diffTime($match) >= 1) ? true : false;
}
