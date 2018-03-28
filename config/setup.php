<?php

/**
 * Created by delimce
 * User: delimce
 * Date: 7/24/12
 * Time: 5:22 PM
 * configuracion inicial para el framework Avalon
 */
/*
 * notacion de variables de configuracion del framework Avalon
 */

define("APP_PATH", 'app/'); //with trailing slash pls
define("WEB_FOLDER", '/russia2018/'); //CARPETA CONTENEDORA
//===============================================
// Other Settings
//===============================================
define("WEB_DOMAIN", 'http://zserver'); //with http:// and NO trailing slash pls
define("VIEW_PATH", 'app/views/'); //with trailing slash pls
define("LAYOUT_PATH", 'app/layouts/'); //with trailing slash pls

define("AV_defaultTimeZone","America/Caracas"); //////zona horaria por defecto para la aplicacion
define("AV_defaultDs", "russia"); /////Data source por defecto. segun los data sources creados en el archivo dataSources.php
define("AV_noDsFound", "DataSource doesn't exist!");

///includes (No cambiar)
include_once(dirname(__FILE__) . "/" . "dataSources.php");
///class library
include_once(dirname(__FILE__) . "/" . "loadClass.php");
include_once (dirname(__FILE__) . "/" . "avalonMvc.php");
include_once (dirname(__FILE__) . "/" . "includes.php");