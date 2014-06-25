<?php

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Clase con ciertas accion de accesibilidad y manejo de componentes html
 *
 * @author luis
 */
class Front {

    /**
     * funcion para llamar la url de los recursos y paginas
     */
    public static function myUrl($url = '', $fullurl = false) {

        $s = $fullurl ? WEB_DOMAIN : '';
        $s.=WEB_FOLDER . $url;
        return $s;
    }

    /**
     * funcion para redireccionar
     * @param type $url
     */
    public static function redirect($url) {
        header('Location: ' . Front::myUrl($url));
        exit();
    }

    /**
     * funcion para redireccionar al parent principal
     * @param type $url
     */
    public static function redirectTop($url) {
        echo '<script type="text/javascript">';
        echo 'top.location.href="' . Front::myUrl($url) . '"';
        echo '</script>';
        exit();
    }

}

?>
