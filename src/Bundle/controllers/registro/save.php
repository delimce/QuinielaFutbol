<?php

use App\Libs\Form;
use App\Libs\Logger;
use App\Libs\ObjectDB;

function _save()
{
    $db = new ObjectDB();

    $pass = Form::getVar("clave");
    $group = Form::getVar("grupo");
    $cipher = md5($pass);

    $db->begin_transaction();

    $db->setTable("usuario");
    $db->setField("nombre", $_POST["fullname"]);
    $db->setField("email", $_POST["email"]);
    $db->setField("usuario", $_POST["username"]);
    $db->setField("clave", $cipher);
    $db->setField("profile", "user");
    $db->setField("pais", $_POST["country"]);
    $db->setField("fecha", @date("Y-m-d H:i:s"));
    $db->insertInTo();

    $userId = $db->getLastId();

    $userData = [
        "name"    => $_POST["fullname"],
        "email"   => $_POST["email"],
        "user"    => $_POST["username"],
        "group"    => $_POST["grupo"],
        "country" => $_POST["country"],
    ];

    # save in group
    if (!empty($group)) {
        $db->setTable("grupo_usuario");
        $db->setField("usuario_id", $userId);
        $db->setField("grupo_id", intval($group));
        $db->setField("fecha", @date("Y-m-d H:i:s"));
        $db->insertInTo();
    }

    $db->commit_transaction();


    $db->close();

    $logger = new Logger();
    $loggerText = sprintf("New user created: %s", json_encode($userData));
    $logger->info($loggerText);

    echo '<h4 class="alert_success">Registro Exitoso</h4>';
}
