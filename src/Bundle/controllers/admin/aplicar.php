<?php

use App\Libs\Form;
use App\Libs\Logger;
use App\Libs\ObjectDB;
use App\Libs\Security;

const RESULT_WINNER = 3;
const RESULT_TIE = 1;
const RESULT_OK = 5;

function _aplicar()
{
    Security::hasPermissionTo("admin");

    $matchId = Form::getVar("idp", $_POST); ///id del partido
    $r1      = Form::getVar("r1", $_POST); ///resultado equipo 1
    $r2      = Form::getVar("r2", $_POST); //resultado equipo 2

    $db = new ObjectDB();

    $db->begin_transaction();
    /////edicion del partido original
    $db->setTable("partido");
    $db->setField("marcador1", intval($r1));
    $db->setField("marcador2", intval($r2));
    $db->setField("estatus", 1);
    $db->updateWhere("id = $matchId");
    matchAudit($matchId, $db->getField("marcador1"), $db->getField("marcador2"));

    ////traer datos partido por usuario
    $db->setSql("select marcador1, marcador2, usuario_id from usuario_partido where partido_id = $matchId");
    $results = $db->getMatrixDb();

    for ($i = 0; $i < count($results); $i++) {
        $db->setTable("usuario_partido");
        $db->setField("estatus", 1);
        $db->setField("puntaje", calcScore($r1, $r2, $results[$i]['marcador1'], $results[$i]['marcador2']));
        $db->updateWhere("usuario_id = {$results[$i]['usuario_id']} and partido_id = $matchId");
        userMatchAudit($results[$i]['usuario_id'], $matchId, $db->getField("puntaje"));
    }

    $db->commit_transaction();

    $db->close();
}

///me dice si se ha llenado el campo del resultado
function calcScore($r1, $r2, $u1, $u2)
{
    $points = 0;
    if ($r1 == $u1 && $r2 == $u2) { ////acierto resultado exacto
        $points = RESULT_OK;
    } else if ((($r1 > $r2) && ($u1 > $u2)) || (($r1 < $r2) && ($u1 < $u2))) { ///acierto ganador
        $points = RESULT_WINNER;
    } else if (($r1 == $r2) && ($u1 === $u2)) { ///acierto empate
        $points = RESULT_TIE;
    }
    return $points;
}

function matchAudit($matchId, $result1, $result2)
{
    $logger = new Logger('adminMatchModify');
    $text = sprintf("Match: %s modified with result: %s", $matchId, $result1 . "-" . $result2);
    $logger->info($text);
}

function userMatchAudit($userId, $matchId, $result)
{
    $logger = new Logger('userMatchClosed');
    $text = sprintf("User: %s match: %s closed with %s points", $userId, $matchId, $result);
    $logger->info($text);
}
