<?php

/**
 * Clase que construye un menu dinamico con los modulos autorizados segun el usuario
 *
 * @author delimce
 */
class BusinessMenu {

    //put your code here
    private $idModule;

    function __construct($modulo = false) {

        if ($modulo) {

            $this->idModule = $modulo;
            $this->hasPermission();
        }
    }

    /**
     * metodo que valida si el usuario tiene acceso al modulo
     */
    private function hasPermission() {

        if ((!Security::isSessionActive()) || !in_array($this->idModule, Security::getSessionVar("user_modules"))) {
            ///si no tiene permiso Logout
            $out = new Front();
            $out->redirect("main/logout");

        }
    }

}