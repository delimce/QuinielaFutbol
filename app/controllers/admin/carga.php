<?php

function _carga() {

     Security::hasPermissionTo("admin");

     $rondaID = Security::getSessionVar("RONDA");
     
     $fecha = Calendar::getDatabaseDateTime();
     //$fecha = '2014-06-12 23:59';
     
     $fechaActual = date("d/m h:i:A");
    
     $db = new ObjectDB();
     
     $db->setSql(FactoryDao::getMatchesToday($rondaID, $fecha));
     $db->executeQuery();
     
     $db->close();
     
     
    $data['siteTitle'] = Security::getSessionVar("TITTLE") . 'Carga de resultados';
    $data['body'][] = View::do_fetch(VIEW_PATH . 'admin/carga.php',array("partidos" => $db, "fecha" => $fechaActual));
    View::do_dump(LAYOUT_PATH . 'layout.php', $data);
}