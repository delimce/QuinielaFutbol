<?php

/**
 * Created by IntelliJ IDEA.
 * User: luis
 * Date: 10/30/12
 * Time: 11:04 PM
 * To change this template use File | Settings | File Templates.
 */
class Form
{

    /**
     * metodo que lee variables pasadas por metodo get o post
     */
    public static function getVar($var, $only = "", $secure = true)
    {

        /////////////////////validar el only
        if (!$only) {

            @$var2 = $_REQUEST[$var];
        } else {

            if ($only == $_GET)
                @$var2 = $_GET[$var];
            else
                @$var2 = $_POST[$var];
        }

        //////////quitando las comillas simples y dobles
        $seguro = trim($var2); ///fuera espacios en blanco

        if ($secure) {
            $seguro = str_replace('"', '', $seguro); ///fuera comillas dobles
            $seguro = str_replace("'", "", $seguro); ///fuera comillas simples
        }

        return $seguro;
    }

/////fin del metodo getvar

    /**
     * metodo que crea un combo box a partir de un query en base de datos
     * parametros: id del objeto,query o objetoDB,valor select, id select, label seleccionar, valor seleccionado
     */
    public function dbComboBox($id, $query, $option, $value, $select = false, $default = false, $onchange = false, $desabilita = false)
    {

        if (is_string($query)) {
            $db = new ObjectDB(); ///crea el objeto de conexion a base de datos
            $db->simpleQuery($query);
        } else {
            $db = $query; ///en caso de que pase el objetodb
        }

        $combo = '<select name="' . $id . '" id="' . $id . '">';
        if ($onchange)
            $combo .= ' onChange="' . $onchange . '"';
        if ($desabilita)
            $combo .= ' disabled="disabled"';
        if ($select)
            $combo .= '<option value="">' . $select . '</option>';
        while ($row = $db->getRegName()) {
            $combo .= '<option value="';
            $combo .= stripslashes($row["$value"]);
            $combo .= '"';
            if ($default == $row["$value"])
                $combo .= ' selected';
            $combo .= '>';
            $combo .= $row["$option"];
            $combo .= '</option>';
        }

        $combo .= '</select>';


        $db->freeResult();

        if (is_string($query)) ///para desconectar
            $db->close();

        return $combo;
    }

    /**
     * crea un combo a partir de una consulta de dos campos para mostrarlo con jquery Mobile
     */
    public function dbComboMobile($id, $query, $option, $value, $select = false, $default = false, $onchange = false, $deshabilita = false)
    {

        if (is_string($query)) {
            $db = new ObjectDB(); ///crea el objeto de conexion a base de datos
            $db->simpleQuery($query);
        } else {
            $db = $query; ///en caso de que pase el objetodb
        }

        $combo = '<select name="' . $id . '" id="' . $id . '"';
        ///estilo mobile
        if ($onchange)
            $combo .= ' onChange="' . $onchange . '"';
        if ($deshabilita)
            $combo .= ' disabled="disabled"';
        $combo .= ' data-native-menu="false" data-mini="true">';
        if ($select)
            $combo .= '<option value="">' . $select . '</option>';

        while ($row = $db->getRegName()) {
            $combo .= '<option value="';
            $combo .= stripslashes($row["$value"]);
            $combo .= '"';
            if ($default == $row["$value"])
                $combo .= ' selected';
            $combo .= '>';
            $combo .= $row["$option"];
            $combo .= '</option>';
        }

        $combo .= '</select>';

        $db->freeResult();


        if (is_string($query)) ///para desconectar
            $db->close();

        return $combo;
    }

    /**
     * metodo que devuelve las opciones de un combo, en el caso de generarlo con codigo ajax
     * @param type $query
     * @param type $option
     * @param type $value
     * @param type $select
     * @param type $default
     * @return string
     */
    public function dbComboBoxAjax($query, $option, $value, $select = false, $default = false)
    {

        if (is_string($query)) {
            $db = new ObjectDB(); ///crea el objeto de conexion a base de datos
            $db->simpleQuery($query);
        } else {
            $db = $query; ///en caso de que pase el objetodb
        }

        $combo = '';

        if ($select)
            $combo .= '<option value="">' . $select . '</option>';

        while ($row = $db->getRegName()) {
            $combo .= '<option value="';
            $combo .= stripslashes($row["$value"]);
            $combo .= '"';
            if ($default == $row["$value"])
                $combo .= ' selected';
            $combo .= '>';
            $combo .= $row["$option"];
            $combo .= '</option>';
        }

        $db->freeResult();

        if (is_string($query)) ///para desconectar
            $db->close();

        return $combo;
    }

    /**
     * crea un combo a partir de una consulta de dos campos para mostrarlo con jquery Mobile
     */
    public function dbComboMobileStyle($id, $query, $option, $value, $select = false, $default = false, $onchange = false, $deshabilita = false)
    {

        if (is_string($query)) {
            $db = new ObjectDB(); ///crea el objeto de conexion a base de datos
            $db->simpleQuery($query);
        } else {
            $db = $query; ///en caso de que pase el objetodb
        }

        $combo = '<select name="' . $id . '" id="' . $id . '"';
        ///estilo mobile
        if ($onchange)
            $combo .= ' onChange="' . $onchange . '"';
        if ($deshabilita)
            $combo .= ' disabled="disabled"';
        $combo .= ' data-native-menu="false" data-mini="true" class="select-with-images">';
        if ($select)
            $combo .= '<option value="">' . $select . '</option>';

        while ($row = $db->getRegName()) {
            $combo .= '<option value="';
            $combo .= stripslashes($row["$value"]);
            $combo .= '"';

            /////imagen que viene en el query
            $combo .= 'icon="';
            $combo .= 'verde';
            $combo .= '"';

            if ($default == $row["$value"])
                $combo .= ' selected';
            $combo .= '>';
            $combo .= $row["$option"];
            $combo .= '</option>';
        }

        $combo .= '</select>';

        $db->freeResult();


        if (is_string($query)) ///para desconectar
            $db->close();

        return $combo;
    }

    /**
     * crea un combo estilo mobile a partir de dos vectores, $option y $value
     */
    public static function arrayCombo($id, $option, $value, $select = false, $default = false)
    {

        $combo = '<select name="' . $id . '" id="' . $id . '"';
        ///estilo mobile
        $combo .= '>';
        if ($select)
            $combo .= '<option value="0">' . $select . '</option>';
        for ($i = 0; $i < count($option); $i++) {
            $combo .= '<option value="';
            $combo .= stripslashes($value[$i]);
            $combo .= '"';
            if ($default == $value[$i])
                $combo .= ' selected';
            $combo .= '>';
            $combo .= $option[$i];
            $combo .= '</option>';
        }

        $combo .= '</select>';

        return $combo;
    }

}
