<?php

use App\Libs\Logger;
use App\Libs\Security;
/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

function _logout() {
    $logger = new Logger();
    $loggedText = sprintf("User %s close session", Security::getUserName());
    $logger->info($loggedText);
    Security::logOff();
}
