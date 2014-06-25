<?php

function _resultados() {

    Security::sessionActive();

    $rondaID = Security::getSessionVar("RONDA");

    $fecha = Calendar::getDatabaseDateTime();

    $fechaActual = date("d/m h:i:A");

    $db = new ObjectDB();

    $db->setSql(FactoryDao::getMatchesToday($rondaID, $fecha));
    $db->executeQuery();

    $db->close();


    $data['siteTitle'] = Security::getSessionVar("TITTLE") . 'Carga de resultados';
    $data['body'][] = View::do_fetch(VIEW_PATH . 'main/results.php', array("partidos" => $db, "fecha" => $fechaActual));
    View::do_dump(LAYOUT_PATH . 'layout.php', $data);
}
