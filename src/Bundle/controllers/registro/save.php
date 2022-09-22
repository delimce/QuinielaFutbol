<?php

use App\Libs\Form;
use App\Libs\Logger;
use App\Libs\ObjectDB;

function _save()
{
    $db = new ObjectDB();

    $pass = Form::getVar("clave");
    $_POST["r0clave"] = md5($pass);

    $db->setTable("usuario");
    $db->setField("nombre", $_POST["r0nombre"]);
    $db->setField("email", $_POST["r0email"]);
    $db->setField("usuario", $_POST["r0usuario"]);
    $db->setField("clave", $_POST["r0clave"]);
    $db->setField("profile", "user");
    $db->setField("contacto", $_POST["r0contacto"]);
    $db->insertInTo();

    $userData = [
        "name"    => $_POST["r0nombre"],
        "email"   => $_POST["r0email"],
        "user"    => $_POST["r0usuario"],
        "contact" => $_POST["r0contacto"],
    ];

    $db->close();

    $logger = new Logger();
    $loggerText = sprintf("New user created: %s", json_encode($userData));
    $logger->info($loggerText);

    echo '<h4 class="alert_success">Registro Exitoso</h4>';
}
