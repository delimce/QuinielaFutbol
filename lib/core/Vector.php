<?php

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Clase para el manejo de array y matrices
 *
 * @author luis
 */
class Vector {

    //put your code here

    static public function findInArray($array, $key, $value, $key2show) {


        for ($j = 0; $j < count($array); $j++) {

            if ($array[$j][$key] == $value) {
                $a = $array[$j][$key2show];
                break;
            }
        }

        return $a;
    }

    //// retorna el arreglo con el elemento eliminado
    static public function delete_from(&$array, $element) {

        $pos = array_search($element, $array);
        for ($i = $pos; $i < count($array); $i++) {

            $array[$i] = $array[$i + 1];
        }
        array_pop($array);
        return $array;
    }

}

?>
