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

const APP_PATH = 'src/Bundle/'; //with trailing slash pls
const WEB_FOLDER = '/'; //CONTAINER FOLDER

//===============================================
// Other Settings
//===============================================
const VIEW_PATH = APP_PATH . 'views/'; //with trailing slash pls
const LAYOUT_PATH = APP_PATH . 'layouts/'; //with trailing slash pls
const IMAGES_PATH = WEB_FOLDER . 'images/'; //

//===============================================
// OTHERS CONSTANTS
//===============================================

const FOOTER_TEXT = '©&nbsp;2012 - 2022 www.delimce.com';
const LOGIN_TEXT = "Pronostica los resultados del mundial";
const MIN_HOUR_TO_BET = 2; //minimo de horas antes del partido permitidas para la apuesta 
const CURRENT_ROUND = 1; //ronda actual de la quiniela