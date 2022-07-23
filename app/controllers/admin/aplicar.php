<?php

function _aplicar() {

    Security::hasPermissionTo("admin");

    $match = Form::getVar("idp", $_POST); ///id del partido
    $r1 = Form::getVar("r1", $_POST); ///resultado equipo 1
    $r2 = Form::getVar("r2", $_POST); //resultado equipo 2

    $db = new ObjectDB();

    $db->begin_transaction();
    /////edicion del partido original
    $db->setTable("partido");
    $db->setField("marcador1", $r1);
    $db->setField("marcador2", $r2);
    $db->setField("estatus", 1);
    $db->updateWhere("id = $match");

    ////traer datos partido por usuario
    $db->setSql("select marcador1, marcador2, usuario_id from usuario_partido where partido_id = $match");
    $results = $db->getMatrixDb();

    for ($i = 0; $i < count($results); $i++) {

        $db->setTable("usuario_partido");
        $db->setField("estatus", 1);
        $db->setField("puntaje", calcScore($r1, $r2, $results[$i]['marcador1'], $results[$i]['marcador2']));
        $db->updateWhere("usuario_id = {$results[$i]['usuario_id']} and partido_id = $match");
    }

    $db->commit_transaction();

    $db->close();
}

///me dice si se ha llenado el campo del resultado
function calcScore($r1, $r2, $u1, $u2) {
    $points = 0;
    if ($r1 == $u1 && $r2 == $u2) { ////acierto resultado exacto
        $points = 5;
    } else if ((($r1 > $r2) && ($u1 > $u2)) or ( ($r1 < $r2) && ($u1 < $u2))) { ///acierto ganador
        $points = 3;
    } else if (($r1 == $r2) && ($u1 == $u2)) { ///acierto empate
        $points = 1;
    }

    return $points;
}
