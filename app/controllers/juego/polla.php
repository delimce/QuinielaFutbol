<?php

function _polla() {

    Security::sessionActive();

    $rondaID = Security::getSessionVar("RONDA");

    $db = new ObjectDB();

    $db->setTable("ronda");
    $db->getTableFields("ronda", "id = $rondaID");
    $rondaName = $db->getField("ronda");

    $fechaActual = date("d/m h:i:A");

    $db->setSql(FactoryDao::getMatches($rondaID, Security::getUserID()));
    $db->executeQuery();

    $data['siteTitle'] = Security::getSessionVar("TITTLE") . 'Mi Quiniela';
    $data['body'][] = View::do_fetch(VIEW_PATH . 'play/form.php', array("partidos" => $db, "ronda" => $rondaName, "fecha" => $fechaActual));
    View::do_dump(LAYOUT_PATH . 'layout.php', $data);

    $db->close();
}

function diffTime($partido) {

    $date1 = strtotime($partido);
    return intval(floor(($date1 - time()) / 3600));
}

//valida si hay tiempo para apostar (minimo 3 horas antes de empezar)
function isInTime($partido) {
    return (diffTime($partido) >= 1) ? true : false;
}
