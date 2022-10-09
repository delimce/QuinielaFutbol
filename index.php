<?php

/**
 * Created by delimce
 * User: luis
 * Date: 7/18/12
 * Time: 6:39 PM
 * To change this template use File | Settings | File Templates.
 */

include __DIR__ . '/vendor/autoload.php';
include_once __DIR__ . '/src/Base/setup.php';

$dotenv = Dotenv\Dotenv::createImmutable(__DIR__);
$dotenv->load();


use App\Libs\Security;
use App\Base\Controller;

Security::initSession();

/***********************************
 * cambiar el id de la ronda en que se encuentre la quiniela para la carga de los partidos.
 * cambiar la session por el id de la ronda que se desee jugar;
 */
Security::setSessionVar("RONDA", 1); ///cambiar por id de la ronda que se quiera jugar

//===============================================
// Start the controller
//===============================================
$controller = new Controller(APP_PATH . 'controllers/', WEB_FOLDER, 'main', 'index');
