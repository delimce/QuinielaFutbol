<?php

function _aplicar() {

    Security::hasPermissionTo("admin");

    $rondaID = Security::getSessionVar("RONDA");

    $partido = Form::getVar("idp", $_POST); ///id del partido
    $r1 = Form::getVar("r1", $_POST); ///resultado equipo 1
    $r2 = Form::getVar("r2", $_POST); //resultado equipo 2


    $db = new ObjectDB();

    $db->begin_transacction();
    /////edicion del partido original
    $db->setTable("partido");
    $db->setField("marcador1", $r1);
    $db->setField("marcador2", $r2);
    $db->setField("estatus", 1);
    $db->updateWhere("id = $partido");

    ////traer datos partido por usuario
    $db->setSql("select marcador1, marcador2, usuario_id from usuario_partido where partido_id = $partido");
    $resultados = $db->getMatrixDb();

    for ($i = 0; $i < count($resultados); $i++) {

        $db->setTable("usuario_partido");
        $db->setField("estatus", 1);
        $db->setField("puntaje", calcularPuntaje($r1, $r2, $resultados[$i]['marcador1'], $resultados[$i]['marcador2']));
        $db->updateWhere("usuario_id = {$resultados[$i]['usuario_id']} and partido_id = $partido");
    }

    $db->commit_transacction();

    $db->close();
}

///me dice si se lleno el resultado
function calcularPuntaje($r1, $r2, $u1, $u2) {
    $puntos = 0;
    if ($r1 == $u1 && $r2 == $u2) { ////acierto resultado exacto
        $puntos = 5;
    } else if ((($r1 > $r2) && ($u1 > $u2)) or ( ($r1 < $r2) && ($u1 < $u2))) { ///acierto ganador
        $puntos = 3;
    } else if (($r1 == $r2) && ($u1 == $u2)) { ///acierto empate
        $puntos = 1;
    }

    return $puntos;
}
