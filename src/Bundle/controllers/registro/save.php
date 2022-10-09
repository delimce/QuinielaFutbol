<?php

use App\Libs\Form;
use App\Libs\Logger;
use App\Libs\ObjectDB;

function _save()
{
    $db = new ObjectDB();

    $pass = Form::getVar("clave");
    $cipher = md5($pass);

    $db->setTable("usuario");
    $db->setField("nombre", $_POST["fullname"]);
    $db->setField("email", $_POST["email"]);
    $db->setField("usuario", $_POST["username"]);
    $db->setField("clave", $cipher);
    $db->setField("profile", "user");
    $db->setField("pais", $_POST["country"]);
    $db->setField("fecha", @date("Y-m-d H:i:s"));
    $db->insertInTo();

    $userData = [
        "name"    => $_POST["fullname"],
        "email"   => $_POST["email"],
        "user"    => $_POST["username"],
        "country" => $_POST["country"],
    ];
    $db->close();

    $logger = new Logger();
    $loggerText = sprintf("New user created: %s", json_encode($userData));
    $logger->info($loggerText);

    echo '<h4 class="alert_success">Registro Exitoso</h4>';
}
