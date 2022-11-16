<?php

use App\Libs\Form;
use App\Libs\Logger;
use App\Libs\ObjectDB;
use ReCaptcha\ReCaptcha;

function _save()
{
    $db = new ObjectDB();
    $logger = new Logger();

    $recaptcha = Form::getVar("g-recaptcha-response");
    $pass = Form::getVar("clave");
    $group = Form::getVar("grupo");
    $cipher = md5($pass);

    # recaptcha validate
    if (!validateRecaptcha($recaptcha)) {
        $loggerText = sprintf("Validate captcha error with: %s", $recaptcha);
        $logger->error($loggerText);
        echo "Recaptcha error";
        return;
    }

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

    $loggerText = sprintf("New user created: %s", json_encode($userData));
    $logger->info($loggerText);

    echo '1';
}


/**
 * @param string $recaptchaResponse
 * @return bool
 */
function validateRecaptcha(string $recaptchaResponse): bool
{
    $recaptchaSecret = $_ENV["RECAPTCHA_SECRET_KEY"];
    $recaptcha = new ReCaptcha($recaptchaSecret);
    $resp = $recaptcha->verify($recaptchaResponse, $_SERVER['REMOTE_ADDR']);

    if ($resp->isSuccess()) {
        return true;
    } else {
        return false;
    }
}
