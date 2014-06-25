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

    /*
     * metodo que despliega el menu
     * idCurrent: id del modulo seleccionado actualmente
     */

    public function showMenu() {

        /////mostrando el menu
        $db2 = new ObjectDB();
        $db2->setSql(FactoryDao::getModuleList(Security::getUserProfile()));
        $db2->executeQuery();

        $class = (empty($this->idModule)) ? 'class="current"' : '';
        $menu = '<li><a href="' . Front::myUrl('main/index') . '"  ' . $class . '>Inicio</a></li>';

        while ($row = $db2->getRegName()) {

            $class = ($this->idModule == $row['id']) ? 'class="current"' : '';
            $current = '/' . $row['id'];

            $menu.= '<li><a href="' . Front::myUrl($row['url'] . $current) . '"  ' . $class . '>' . $row['nombre'] . '</a></li>';
        }

        $db2->freeResult();
        $db2->close();

        return $menu;
    }

}

?>
