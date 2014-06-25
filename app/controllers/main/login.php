<?php

function _login() {

    $user = Form::getVar("user", $_POST);
    ////logueandose
    if (!empty($user)) {

        $db = new ObjectDB();

        $pass = Form::getVar("clave", $_POST);

        $db->setSql(FactoryDao::getLoginData($user, $pass));
        $db->getResultFields();

        if ($db->getNumRows() > 0) {

            ////guardando variables de sesion 
            Security::setUserID($db->getField("id"));
            Security::setUserName($db->getField("nombre"));
            Security::setUserProfileName($db->getField("profile"));
            $id = $db->getField("id");

            $db->begin_transacction();
   
            /////////////
            ////registro de acceso
            $db->setTable("accesos_log");
            $db->setField("user", Security::getUserID());
            $db->setField("perfil", Security::getUserProfileName());
            $fecha = Calendar::getDatabaseDateTime();
            $db->setField("fecha", $fecha);
            $cliente = $_SERVER['HTTP_USER_AGENT'];
            $db->setField("cliente_info", $cliente);
            $db->insertInTo();

            $db->commit_transacction();

            echo $id;

            //////
        } else {
            echo 0;
        }


        $db->close(); //cerrando conexion
    } else { ///no se ha logueado
        $form = new Form();

        $data['siteTitle'] = Security::getSessionVar("TITTLE") . 'Login';
        $data['body'][] = View::do_fetch(VIEW_PATH . 'main/login_form.php');
        View::do_dump(LAYOUT_PATH . 'loginLayout.php', $data);
    }
}