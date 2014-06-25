<?php

function _save() {

    ////para el cambio de clave
    $db = new ObjectDB();

    
    ////si todo va bien
    $clave = Form::getVar("clave");
    $_POST["r0clave"] = md5($clave);
    $db->dataInsert("r", "0", "usuario", $_POST);

    $db->close();


    echo '<h4 class="alert_success">Registro Exitoso</h4>';
}

?>
