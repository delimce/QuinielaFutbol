<?php

use App\Base\View;
use App\Libs\Form;
use App\Libs\Calendar;
use App\Libs\ObjectDB;
use App\Libs\Security;
use App\Libs\FactoryDao;

function _login()
{
    $user = Form::getVar("user", $_POST);

    if (!empty($user)) {

        $db = new ObjectDB();
        @$pass = Form::getVar("clave", $_POST);
        @$db->setSql(FactoryDao::getLoginData($user, $pass));
        @$db->getResultFields();

        $result = 0;
        if ($db->getNumRows() > 0) {

            ////guardando variables de sesion 
            Security::setUserID($db->getField("id"));
            Security::setUserName($db->getField("nombre"));
            Security::setUserProfileName($db->getField("profile"));
            $id = $db->getField("id");

            $db->begin_transaction();
            $db->setTable("accesos_log");
            $db->setField("user", Security::getUserID());
            $db->setField("perfil", Security::getUserProfileName());
            $date = Calendar::getDatabaseDateTime();
            $db->setField("fecha", $date);
            $visitor = $_SERVER['HTTP_USER_AGENT'];
            $db->setField("cliente_info", $visitor);
            $db->insertInTo();

            $db->commit_transaction();
            $result = $id;
        }

        echo $result;
        $db->close(); //cerrando conexion
    } else { ///no se ha logueado
        $data['siteTitle'] = Security::getSessionVar("TITTLE") . 'Login';
        $data['body'][] = View::do_fetch(VIEW_PATH . 'main/login_form.php');
        View::do_dump(LAYOUT_PATH . 'loginLayout.php', $data);
    }
}
