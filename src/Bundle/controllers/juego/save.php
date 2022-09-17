<?php

function _save()
{

    Security::sessionActive();
    $roundID = Security::getSessionVar("RONDA");
    $db = new ObjectDB();

    /////////traer numero de partidos a guardar
    /////nota necesito traer solo la fecha de los juegos que apliquen
    /////para que sin importar que el estatus haya cambiado no borre los que tengan estatus 0
    //////es necesario pasarle la fecha actual
    $currentDate = Calendar::getDatabaseDateTime();

    $db->setSql("select id,estatus,fecha from partido where ronda_id = $roundID ");
    $matches = $db->getMatrixDb(); ///ids y estatus de los partidos q aplican

    $db->begin_transaction();

    $db->setTable("usuario_partido");
    $db->setField("usuario_id", Security::getUserID());
    $db->setField("ronda_id", $roundID);

    //// borrando el partido si no tiene resultados cargados y si aun no se ha hecho
    $db->deleteWhere("usuario_id = " . Security::getUserID() . " and estatus = 0 and partido_id in (select id from partido where estatus = 0 and (fecha - INTERVAL 60 MINUTE) > '$currentDate' ) ");

    ////insertando resultados de partidos
    for ($i = 0; $i < count($matches); $i++) {

        if (!isNull($_POST[$matches[$i]["id"] . "_m1"]) && $matches[$i]["estatus"] == 0 && isValidDate($matches[$i]["fecha"])) {

            ////inserto nuevo marcador
            $db->setField("partido_id", $matches[$i]["id"]);
            $db->setField("marcador1", $_POST[$matches[$i]["id"] . "_m1"]);
            $db->setField("marcador2", $_POST[$matches[$i]["id"] . "_m2"]);
            $db->insertInTo(false);
        }
    }

    $db->commit_transaction();

    $db->close();
}

function isNull($result): bool
{
    return ($result === '');
}

function isValidDate($match)
{
    $date1 = strtotime($match);
    $res = (int)(floor(($date1 - time()) / 3600));
    return ($res > 0);
}
