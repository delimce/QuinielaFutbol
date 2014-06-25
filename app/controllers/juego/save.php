<?php

function _save() {

    Security::sessionActive();

    $rondaID = Security::getSessionVar("RONDA");

    $db = new ObjectDB();

    /////////traer numero de partidos a guardar
    /////nota necesito traer solo la fecha de los juegos que apliquen
    /////para que sin importar que el estatus haya cambiado no borre los que tengan estatus 0
    //////es necesario pasarle la fecha actual
    $fechaActual = Calendar::getDatabaseDateTime();

    $db->setSql("select id,estatus,fecha from partido where ronda_id = $rondaID ");
    $partidos = $db->getMatrixDb(); ///ids y estatus de los partidos q aplican

    $db->begin_transacction();

    $db->setTable("usuario_partido");
    $db->setField("usuario_id", Security::getUserID());
    $db->setField("ronda_id", $rondaID);

       //// borrando el partido si no tiene resultados cargados y si aun no se ha hecho
       $db->deleteWhere("usuario_id = " . Security::getUserID() . " and estatus = 0 and partido_id in (select id from partido where estatus = 0 and fecha > '$fechaActual' ) ");
    
    ////insertando resultados de partidos
    for ($i = 0; $i < count($partidos); $i++) {
       
        if (!isNull($_POST[$partidos[$i]["id"] . "_m1"]) && !isNull($_POST[$partidos[$i]["id"] . "_m1"]) && $partidos[$i]["estatus"] == 0 && isFechaValida($partidos[$i]["fecha"])) {
        
            ////inserto nuevo marcador
            $db->setField("partido_id", $partidos[$i]["id"]);
            $db->setField("marcador1", $_POST[$partidos[$i]["id"] . "_m1"]);
            $db->setField("marcador2", $_POST[$partidos[$i]["id"] . "_m2"]);
            $db->insertInTo(false);
        }
    }

    $db->commit_transacction();

    $db->close();
}

///me dice si se lleno el resultado
function isNull($valor) {
    return ($valor == '') ? true : false;
}

function isFechaValida($partido) {
    $date1 = strtotime($partido);
    $res = (int)(floor(($date1 - time()) / 3600));
    
    return ($res>0);
    
}
