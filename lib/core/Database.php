<?php

/**
 * Created by IntelliJ IDEA.
 * User: delimce
 * Date: 7/24/12
 * Time: 10:49 AM
 * To change this template use File | Settings | File Templates.
 */
Abstract class Database {
    /**
     * variables para la conexion
     */

    private $dbms, $host, $port, $user, $pwd, $schema, $database;
    /**
     * variable para la base de datos se gun dataSource
     */
    private $db;

    /**
     * constructor de la clase
     */

    function __construct() {
        $argv = func_get_args();
        switch (func_num_args()) {
            default:
            case 0:
                self::__construct1(); ///datasource por defecto
                break;
            case 1:
                if($argv[0]!=null){
                    self::__construct2($argv[0]); ////data source seleccionado
                }  else {
                   self::__construct3(); ///sin conexion a base de datos
                }                
             
                break;
        }
    }

    /**
     * constructor en caso de trabajar con el dataSource por defecto
     */

    function __construct1() {


        $datasource = AV_defaultDs; ///dataSource por efecto
        $this->getConnect($datasource);
    }

    /**
     * constructor en caso de enviar el dataSource o no decidir conectarse
     */

    function __construct2($datasource) {

        global $dataSources;
        if (!array_key_exists($datasource, $dataSources))
            die(AV_noDsFound);

        if ($datasource) {
            $this->getConnect($datasource);
        }
    }
    
    
    /**
     * sin conexion a base de datos
     */

    function __construct3(){
        
        
    }






    /**
     * metodo usado para la conexion (sin importar el constructor usado)
     */

    private function getConnect($datasource) {


        global $dataSources;

        try { ///en caso de que el server no muestre los errores
            $this->dbms = strtolower($dataSources[$datasource]["dbms"]);
            $this->host = $dataSources[$datasource]["host"];
            $this->port = $dataSources[$datasource]["port"];
            $this->schema = $dataSources[$datasource]["schema"];
            $this->database = $dataSources[$datasource]["database"];
            $this->user = $dataSources[$datasource]["user"];
            $this->pwd = ($dataSources[$datasource]["encrypt"])?convert_uudecode($dataSources[$datasource]["pwd"]):$dataSources[$datasource]["pwd"];  ////contiene cifrado
            //   metodo que selecciona la clase para interactuar con la base de datos
            $this->setDb($this->dbms);
            $this->getDb()->connect($this->host, $this->port, $this->user, $this->pwd, $this->schema, $this->database);
        } catch (ErrorException $e) {
            $e->getMessage();
        }
    }

    /**
     * metodo para seleccionar la clase del vendor para manejar la base de datos segun el motor
     */

    private function setDb($dbms) {
        if ($dbms == "mysql") {
            $this->db = new Mysql();
        }
    }

    private function getDb() {
        return $this->db;
    }

    /**
     * libera el objeto resultset
     */

    public function freeResult() {

        try {
            $this->getDb()->freeResult();
        } catch (ErrorException $e) {
            $e->getMessage();
        }
    }

    /**
     * metodo que cierra una conexion de base de datos
     */

    public function close() {

        try {
            $this->getDb()->close();
        } catch (ErrorException $e) {
            $e->getMessage();
        }
    }

    /**
     * libera el objeto resultset y cierra la conexion
     */

    public function freeAndClose() {

        $this->getDb()->freeResult();
        $this->getDb()->close();
    }

    /**
     * metodo para un query simple
     */

    public function simpleQuery($sql) {
        try {
            $this->getDb()->simpleQuery($sql);
        } catch (ErrorException $e) {
            $e->getMessage();
        }
    }

    /**
     * metodo para preparar Statement
     */

    public function prepareStmt($sql) {

        try {
            $this->getDb()->prepareQuery($sql);
        } catch (ErrorException $e) {
            $e->getMessage();
        }
    }

    /**
     * metodo para bindear los parametros del statement
     */

    public function setParam($types, $params) {

        try {
            $this->getDb()->setParam($types, $params);
        } catch (ErrorException $e) {
            $e->getMessage();
        }
    }

    /**
     * metodo que ejecuta el query prepareStatement
     */

    protected function execute() {

        try {
            $this->getDb()->execute();
        } catch (ErrorException $e) {
            $e->getMessage();
        }
    }

    public function getResultSet() {

        return $this->getDb()->getResult();
    }

    /**
     * para traer el nombre de los campos del registro
     */

    public function getFieldsNames() {

        return $this->getDb()->getResultFields();
    }

    /**
     * para traer el numero del campo devuelto
     */

    public function getRegNumber() {
        return $this->getDb()->getRegNumber();
    }

    /**
     * para traer el nombre del campo devuelto
     */

    public function getRegName() {
        return $this->getDb()->getRegName();
    }

    public function lastIdInserted() {

        $this->getDb()->lastIdInserted();
        return $this->getDb()->getNewId();
    }

    /**
     * traer numero de registros
     */

    public function getNumRowsRequested() {


        return $this->getDb()->getNreg();
    }
    
    /**
     * un sinonimo de getNumRowsRequested() 
     */
    
    public function getNumRows(){
        return $this->getNumRowsRequested();
    }



    /**
     * escribe la info del server
     */

    public function getServerInfo() {


        try {
            echo $this->getDb()->getServerInfo();
        } catch (ErrorException $e) {
            $e->getMessage();
        }
    }

    /**
     * escapa los caracteres especiales
     */

    public function escapeString($value) {

        try {
            return $this->getDb()->escapeString($value);
        } catch (ErrorException $e) {
            $e->getMessage();
        }
    }

    /**
     * metodos para las transacciones
     */

    public function begin_transacction() {
        $this->getDb()->begin_transacction();
    }

    public function commit_transacction() {
        $this->getDb()->commit_transacction($result = true);
    }
    
    
    /**
     * metodo que devuelve los atributos del row  con los nombres de los campos del query
     */
    
    public function getRowFields(){
        
        if(method_exists($this->getDb(),'rowFields'))
            
            return $this->getDb()->rowFields();
            
        else die("error: Method 'getRowFields' is not implemented for: ".$this->dbms );
    }

}
