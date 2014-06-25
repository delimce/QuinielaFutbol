<?php

/**
 * Created by IntelliJ IDEA.
 * User: delimce
 * Date: 7/19/12
 * Time: 1:30 PM
 * To change this template use File | Settings | File Templates.
 */
class Mysql implements TemplateDB {

    private $dbc; ///variable de conexion
    private $result; ////resultado de los query
    private $stmt;   ////sql ya preparado
    private $nreg; ///numero de registros del query
    private $newId; ////nuevo id insertado

    //////getters y setters

    public function setStmt($stmt) {
        $this->stmt = $stmt;
    }

    public function getStmt() {
        return $this->stmt;
    }

    public function setDbc($dbc) {
        $this->dbc = $dbc;
    }

    public function getDbc() {
        return $this->dbc;
    }

    public function setNreg($nreg) {
        $this->nreg = $nreg;
    }

    public function getNreg() {
        return $this->nreg;
    }

    public function setResult($result) {
        $this->result = $result;
    }

    public function getResult() {
        return $this->result;
    }

    public function connect($host, $port, $user, $pwd, $schema, $database) {

        $this->dbc = mysqli_connect($host, $user, $pwd, $database, $port) or die('<font color=#FF0000> conection failed: </font>' . mysqli_connect_error());
    }

    public function close() {
        mysqli_close($this->dbc);
    }

    public function simpleQuery($sql) {

        $this->result = mysqli_query($this->getDbc(), $sql) or die('<font color=#FF0000> error en query: </font>' . mysqli_error($this->getDbc()));
        $this->setNreg($this->numOfRowsRequested());
    }

    //devuelve un arreglo con el nombre de los campos consultados enpezando desde la pos 0

    public function getResultFields() {

        $x = 0;

        while ($finfo = mysqli_fetch_field($this->result)) {

            $names[$x] = $finfo->name;
            $x++;
        }

        return $names;
    }

    ///funcion para obtener el valor del registro en tipo numero

    public function getRegNumber() {

        return @mysqli_fetch_row($this->result);
    }

    ////funcion para obtener el valor del registro en tipo cadena o nombre

    public function getRegName() {

        return @mysqli_fetch_assoc($this->result);
    }

    public function prepareQuery($sql) {
        return mysqli_prepare($this->getDbc(), $sql);
    }

    public function setParam($types, $params) {
        mysqli_stmt_bind_param($this->getStmt(), $types, $params);
    }

    public function execute() {
        mysqli_stmt_execute($this->getStmt());

        mysqli_stmt_close($this->getStmt()); // CLOSE $stmt
    }

    public function freeResult() {
        //  mysql_free_result($this->getDbc());


        while (mysqli_more_results($this->getDbc())) {
            if (mysqli_next_result($this->getDbc())) {
                $this->result = mysqli_use_result($this->getDbc());
                @mysqli_free_result($this->result);
            }
        }
    }

    public function lastIdInserted() {

        $this->newId = mysqli_insert_id($this->getDbc()) or die('<font color=#FF0000> Error en ID generado de insert</font>' . mysqli_error($this->getDbc()));
    }

    public function numOfRowsRequested() {
        return @mysqli_num_rows($this->getResult());
    }

    public function getServerInfo() {

        return mysqli_get_host_info($this->getDbc());
    }

    public function escapeString($value) {

        return mysqli_real_escape_string($this->getDbc(), $value);
    }

    public function getNewId() {
        return $this->newId;
    }

    
    
    public function begin_transacction() {

        ////iniciando la transaccion
        mysqli_autocommit($this->dbc, FALSE);
    }

    public function commit_transacction($result = true) {

        if ($result)
            mysqli_commit($this->dbc); else
            mysqli_rollback($this->dbc); ////finalizando la transaccion
        mysqli_autocommit($this->dbc, TRUE);
    }
    
    
    
    /*
     * metodo para transformar en atributos los campos regresados de una consulta
     */

    public function rowFields(){
        
        return mysqli_fetch_object($this->result);
    }
    
}
