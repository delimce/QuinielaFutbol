<?php

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of DateTime
 *
 * @author luis
 */
class Calendar {

    function __construct($format) {

        $this->setFormat($format);
    }

    private $format; /// solo fecha

    private function setFormat($format) {

        $this->format = $format;
    }

    private function getFormat() {
        return $this->format;
    }

    public function getCurrentDate() {

        $formato = $this->getFormat();
        return @date($formato);
    }

    public static function getCurrentTime() {
        return date("H:i:s");
    }

    /**
     * trae el formato de la fecha para insertar en base de datos
     * @return type
     */
    public static function getDatabaseDateTime() {
        return date("Y-m-d H:i:s");
    }

    /**
     * escribe la fecha en el formato deseado (caso basededatos)
     * @param type $datetime
     * @return string
     */
    public function datetime($datetime) {

        return date($this->format, strtotime($datetime));
    }

}

?>
