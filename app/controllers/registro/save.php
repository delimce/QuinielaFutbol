<?php

function _save() {

    ////para el cambio de clave
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

    $db->close();
    echo '<h4 class="alert_success">Registro Exitoso</h4>';
}
