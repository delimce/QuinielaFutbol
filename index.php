<?php
/**
 * Created by delimce
 * User: luis
 * Date: 7/18/12
 * Time: 6:39 PM
 * To change this template use File | Settings | File Templates.
 */
include_once 'config/setup.php';





Security::initSession();

///zona horaria para la aplicacion
date_default_timezone_set(AV_defaultTimeZone);

/////variable de titulo del sitio
Security::setSessionVar("TITTLE", "Quiniela Rusia 2018 ");
Security::setSessionVar("RONDA",1);

//===============================================
// Start the controller
//===============================================
$controller = new Controller(APP_PATH . 'controllers/', WEB_FOLDER, 'main', 'index');

