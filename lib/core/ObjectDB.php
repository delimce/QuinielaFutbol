<?php

/**
 * Created by IntelliJ IDEA.
 * User: delimce
 * Date: 8/8/12
 * Time: 9:54 AM
 * To change this template use File | Settings | File Templates.
 */
class ObjectDB extends Database {

    private $table; ///tabla de base de datos
    private $fields = array(); ///campos de la tabla (vector asociativo)
    private $sql = ''; /////variable con la sentencia sql a ejecutar.
    private $lastId; ////ultimo id insertado
    /////prepare statement
    private $prepare = false; ////si el query es de tipo prepareStateMent
    private $paramsTypes = ''; ///tipos de los parametros para ejecutar el query (bind_param)

    private function resetFields() {

        $this->fields = array();
        $this->paramsTypes = '';
    }

    /////metodos getter y setter
    public function setTable($table) {
        $this->table = $table;
        $this->sql = '';
        $this->resetFields();
    }

    public function getTable() {
        return $this->table;
    }

    /**
     * asigna un valor y clave a la lista de campos
     */
    public function setField($key, $val) {
        $this->fields[$key] = $val;
    }

    /**
     * retorna un valor a partir de una clave del campo
     */
    public function getField($key) {
        return $this->fields[$key];
    }

    /**
     * retorna toda la data del vector $fields
     */
    public function getFields() {
        print_r($this->fields);
    }

    /**
     * agrega campos al enunciado del query
     */
    public function setFields($campos, $where = false, $order = false) {
        if ($this->sql)
            $this->sql = '';
        $this->sql = "select " . $campos . " from " . $this->getTable();
        if ($where)
            $this->setWhere($where);
        if ($order)
            $this->concatSql(" ORDER BY " . $order);
    }

    /*
     * agrega la clausula where al atributo sql
     */

    public function setWhere($where) {

        $this->concatSql(" where $where");
    }

    /*
     * retorna el numero de campos en el objetoDB
     */

    public function getNumFields() {

        return count($this->fields);
    }

    public function setSql($sql) {
        $this->sql = $sql;
    }

    public function getSql() {
        return $this->sql;
    }

    /*
     * ejecuta el metodo simpleQuery de Database
     */

    public function executeQuery() {

        $this->simpleQuery($this->getSql());
    }

    ////metodo para concatenar en la variable del query sql
    public function concatSql($string) {

        $this->sql .= (string) $string;
    }

    /*
     * setea el uso del prepare Statement para el uso de todos los querys
     */

    public function setPrepare($bool = true) {
        $this->prepare = $bool;
    }

    /*
     * metodo para insertar valores en una tabla dada la especificacion Ansi SQL
     * por defecto se genera el id incremental
     */

    public function insertInTo($identity = true) {

        $this->sql = "insert into $this->table ";
        $f = array_keys($this->fields); ///obteniendo claves
        $Fields = implode(",", $f);
        $this->concatSql("($Fields) values (");

        $i = 1;
        foreach ($this->fields as $value) {

            if (!$this->prepare) {

                if (!is_numeric($value))
                    $valor = "'" . $this->escapeString($value) . "'";
                else
                    $valor = $value;
            } else {
                //////para ver el tipo de parametro a insertar
                if (is_string($value))
                    $this->paramsTypes .= "s";
                elseif (is_integer($value))
                    $this->paramsTypes .= "i";
                elseif (is_real($value))
                    $this->paramsTypes .= "r";
                $valor = '?';
            }

            $this->concatSql($valor);
            if ($i < count($this->fields))
                $this->concatSql(","); ///para que añada las , entre cada valor
            $i++;
        }

        $this->concatSql(")");

        // print $this->getSql();
        /////ejecuta el insert
        if (!$this->prepare) { ///en caso de que no sea seguro preparestmt
            $this->executeQuery();
        } else {
            $this->prepareStmt($this->getSql());
            $this->execute();
        }

        if ($identity) ////se trae el ultimo id insertado
            $this->setLastId();
    }

    /*
     * metodo para actualizar valores de una tabla
     */

    public function updateWhere($where) {


        $this->sql = "update $this->table ";
        $this->concatSql("set ");
        $f = array_keys($this->fields); ///obteniendo claves
        $i = 0;

        foreach ($this->fields as $value) {

            if (!$this->prepare) {

                if (!is_numeric($value))
                    $valor = "'" . $this->escapeString($value) . "'";
                else
                    $valor = $value;
            }

            $this->concatSql("$f[$i]  =  $valor ");
            if ($i + 1 < count($this->fields))
                $this->concatSql(", "); ///para que añada las , entre cada valor
            $i++;
        }


        $this->concatSql("where " . $where);

        ///execute
        if ($where)
            $this->executeQuery();
    }

    /*
     * metodo para eliminar de la tabla
     */

    public function deleteWhere($where) {
        $this->sql = "delete from $this->table ";
        $this->concatSql("where " . $where);
        ///execute
        if ($where)
            $this->executeQuery();
    }

    /*
     * metodo para setiar el ultimoID insertado
     */

    private function setLastId() {
        $this->lastId = $this->lastIdInserted();
    }

    /*
     * obteniendo el ultimoID insertado
     */

    public function getLastId() {
        return $this->lastId;
    }

    /**
     * trae el resultado (vector asociativo) con los campos
     * de 1 registro (analogo: simple_db)
     */
    public function getResultFields() {

        $this->resetFields();
        $this->executeQuery();

        $fields = $this->getFieldsNames();
        $row = $this->getRegNumber();


        for ($j = 0; $j < count($fields); $j++)
            $this->setField($fields[$j], stripslashes($row[$j]));

        $this->freeResult();
    }

    /**
     * hace una consulta simple de una tabla unica
     * fields: campos separados por ,
     * where: en caso de que filtre
     */
    public function getTableFields($fiels, $where = false) {

        $this->sql = "select $fiels from ";
        $this->concatSql($this->getTable());
        if ($where)
            $this->concatSql(" where " . $where);

        return $this->getResultFields();
    }

    /**
     * arma un arreglo simple con el resultado de una consulta de
     *  1 campo
     */
    public function getArrayDb() {

        $this->executeQuery();

        $i = 0;
        while ($row = $this->getRegNumber()) {

            $vector[$i] = $row[0];
            $i++;
        }

        $this->freeResult();
        return $vector;
    }

    /*
     * vectorDb genera un arreglo unidimensional con los nombres de los campos consultados (simple_db)
     */

    public function vectorDb() {

        $this->getResultFields();

        if ($this->getNumRows() > 0) {

            foreach ($this->fields as $i => $value) {
                $vector[$i] = $value;
            }
        }

        return $vector;
    }

    /**
     * matrizdb genera un arreglo asociativo bidimensional de varias filas a partir de un query
     * (estructura_db)
     */
    public function getMatrixDb() {

        $this->executeQuery();
        $campos = $this->getFieldsNames();
        $i = 0;
        while ($row = $this->getRegNumber()) {    //N de registros
            for ($j = 0; $j < count($campos); $j++) {   ////N campos
                $a[$i][$campos[$j]] = stripslashes($row[$j]);
            }

            $i++;
        }

        $this->freeResult();
        return $a;
    }

    /**
     * funcion que hace el query de los campos de la tabla seteada, devuelve el resulset asociado.
     */
    public function getTableAllRecords($fiels, $where = false, $order = false) {

        $this->sql = "select $fiels from ";
        $this->concatSql($this->getTable());
        if ($where)
            $this->concatSql(" where " . $where);
        if ($order)
            $this->concatSql(" ORDER BY " . $order);

        $this->executeQuery();
    }

    /*     * ****************METODOS PARA GUARDAR VARIABLES PROVENIENTES DE FORMULARIOS******************** */


    /* metodo insert_data, que inserta valores de un formulario en una tabla de la base de datos
      $pref: toma el prefijo de cada campo que seran los valores que se van a insertar ejemplo r-nombre "r"
      $sep es el caracter que separa al nombre del campo y el prefiejo ejemplo r_nombre nota la separacion debe ser un "_"
      $tabla: la tabla de la base de datos que sufrir los cambios (false) omite este parametro
      $metodo: vectores globales segun el metodo por el cual vienen los valores del formulario "$_GET" o "$_POST"
      IMPOTANTE: EL NOMBRE DE LOS CAMPOS DEBE SER EL NOMBRE DE LAS VARIABLES DE FORMULARIO PASADAS

     */

    public function dataInsert($pref, $sep, $table, $vars) {

        ////objeto de base de datos

        if ($table)
            $this->setTable($table);

        $r = 0;
        while (list($key, $value) = each($vars)) {


            $value = Form::getVar($key, $vars, false); ///hay confianza y no aplica la seguridad

            if (!empty($value)) { ///si el campo no es vacio lo inserto
                $nuevo = explode($sep, $key);

                if ($nuevo[0] == $pref) {


                    $this->setField($nuevo[1], $value);

                    $r++;
                }
            }
        }

        ///insertando en la tabla
        if ($this->getNumFields() > 0)
            $this->insertInTo();
    }

    /**
     *  metodo edit_data, que edita valores de un formulario en una tabla de la base de datos
      $pref: toma el prefijo de cada campo que seran los valores que se van a insertar ejemplo r-nombre "r"
      $sep es el caracter que separa al nombre del campo y el prefiejo ejemplo r_nombre nota la separacion debe ser un "_"
      $tabla: la tabla de la base de datos que sufrir los cambios (false) omite este parametro
      $metodo: vectores globales segun el metodo por el cual vienen los valores del formulario "$_GET" o "$_POST"
      $where: condicion de edicion ejemplo id='1'
      IMPOTANTE: EL NOMBRE DE LOS CAMPOS DEBE SER EL NOMBRE DE LAS VARIABLES DE FORMULARIO PASADAS
     */
    public function dataUpdate($pref, $sep, $table, $vars, $where = "") {


        if ($table)
            $this->setTable($table);

        $r = 0;
        while (list($key, $value) = each($vars)) {

            $value = Form::getvar($key, $vars, false); ///hay confianza y no aplica la seguridad
            //$value = trim($_POST[$key]);
            $nuevo = explode($sep, $key);

            if ($nuevo[0] == $pref) {

                $this->setField($nuevo[1], $value);

                $r++;
            }
        }

        ///editando en la tabla
        if ($this->getNumFields() > 0)
            $this->updateWhere($where);
    }

}
