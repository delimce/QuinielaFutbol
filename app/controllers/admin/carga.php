<?php

function _carga() {

     Security::hasPermissionTo("admin");
     $roundID = Security::getSessionVar("RONDA");
     
     $date = Calendar::getDatabaseDateTime();
     $currentDate = date("d/m h:i:A");
    
     $db = new ObjectDB();
     $db->setSql(FactoryDao::getMatchesToday($roundID, $date));
     $db->executeQuery();
     
     $db->close();
     
    $data['siteTitle'] = Security::getSessionVar("TITTLE") . 'Carga de resultados';
    $data['body'][] = View::do_fetch(VIEW_PATH . 'admin/carga.php',array("partidos" => $db, "fecha" => $currentDate));
    View::do_dump(LAYOUT_PATH . 'layout.php', $data);
}