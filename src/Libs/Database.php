<?php

namespace App\Libs;

use Exception;

/**
 * Created by IntelliJ IDEA.
 * User: delimce
 * Date: 7/24/12
 * Time: 10:49 AM
 * To change this template use File | Settings | File Templates.
 */
abstract class Database
{
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

    function __construct()
    {
        # using file .env
        self::__construct3(); 
    }

    /**
     * constructor en caso de trabajar con el dataSource por defecto
     */

    function __construct1()
    {
        $datasource = AV_defaultDs; ///dataSource por efecto
        $this->getConnect($datasource);
    }

    /**
     * constructor en caso de enviar el dataSource o no decidir conectarse
     */

    function __construct2($datasource)
    {

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

    function __construct3()
    {
        $newDataSource = [];
        $newDataSource["dbms"]      = "Mysql";
        $newDataSource["host"]      = $_ENV['DB_HOST'];
        $newDataSource["port"]      = $_ENV['DB_PORT'];
        $newDataSource["database"]  = $_ENV['DB_NAME'];
        $newDataSource["user"]      = $_ENV['DB_USER'];
        $newDataSource["pass"]      = $_ENV['DB_PASS'];
        $this->getConnect($newDataSource);
    }




    /**
     * @param mixed $datasource
     * 
     * @return [type]
     */
    private function getConnect($datasource)
    {
        try { ///en caso de que el server no muestre los errores
            $this->dbms     = strtolower($datasource["dbms"]);
            $this->host     = $datasource["host"];
            $this->port     = $datasource["port"] ?? "3306";
            $this->schema   = $datasource["schema"] ?? "";
            $this->database = $datasource["database"];
            $this->user     = $datasource["user"];
            $this->pwd      = $datasource["pass"];
            //   metodo que selecciona la clase para interactuar con la base de datos
            $this->setDb($this->dbms);
            $this->getDb()->connect($this->host, $this->port, $this->user, $this->pwd, $this->schema, $this->database);
        } catch (Exception $e) {
            $e->getMessage();
        }
    }

    /**
     * metodo para seleccionar la clase del vendor para manejar la base de datos segun el motor
     */

    private function setDb($dbms)
    {
        if ($dbms == "mysql") {
            $this->db = new Mysql();
        }
    }

    private function getDb()
    {
        return $this->db;
    }

    /**
     * libera el objeto resultset
     */

    public function freeResult()
    {

        try {
            $this->getDb()->freeResult();
        } catch (Exception $e) {
            $e->getMessage();
        }
    }

    /**
     * metodo que cierra una conexion de base de datos
     */

    public function close()
    {

        try {
            $this->getDb()->close();
        } catch (Exception $e) {
            $e->getMessage();
        }
    }

    /**
     * libera el objeto resultset y cierra la conexion
     */

    public function freeAndClose()
    {

        $this->getDb()->freeResult();
        $this->getDb()->close();
    }

    /**
     * metodo para un query simple
     */

    public function simpleQuery($sql)
    {
        try {
            $this->getDb()->simpleQuery($sql);
        } catch (Exception $e) {
            $e->getMessage();
        }
    }

    /**
     * metodo para preparar Statement
     */

    public function prepareStmt($sql)
    {

        try {
            $this->getDb()->prepareQuery($sql);
        } catch (Exception $e) {
            $e->getMessage();
        }
    }

    /**
     * metodo para bindear los parametros del statement
     */

    public function setParam($types, $params)
    {

        try {
            $this->getDb()->setParam($types, $params);
        } catch (Exception $e) {
            $e->getMessage();
        }
    }

    /**
     * metodo que ejecuta el query prepareStatement
     */

    protected function execute()
    {

        try {
            $this->getDb()->execute();
        } catch (Exception $e) {
            $e->getMessage();
        }
    }

    public function getResultSet()
    {

        return $this->getDb()->getResult();
    }

    /**
     * para traer el nombre de los campos del registro
     */

    public function getFieldsNames()
    {

        return $this->getDb()->getResultFields();
    }

    /**
     * para traer el numero del campo devuelto
     */

    public function getRegNumber()
    {
        return $this->getDb()->getRegNumber();
    }

    /**
     * para traer el nombre del campo devuelto
     */

    public function getRegName()
    {
        return $this->getDb()->getRegName();
    }

    public function lastIdInserted()
    {

        $this->getDb()->lastIdInserted();
        return $this->getDb()->getNewId();
    }

    /**
     * traer numero de registros
     */

    public function getNumRowsRequested()
    {


        return $this->getDb()->getNreg();
    }

    /**
     * un sinonimo de getNumRowsRequested() 
     */

    public function getNumRows()
    {
        return $this->getNumRowsRequested();
    }



    /**
     * escribe la info del server
     */

    public function getServerInfo()
    {


        try {
            echo $this->getDb()->getServerInfo();
        } catch (Exception $e) {
            $e->getMessage();
        }
    }

    /**
     * escapa los caracteres especiales
     */

    public function escapeString($value)
    {

        try {
            return $this->getDb()->escapeString($value);
        } catch (Exception $e) {
            $e->getMessage();
        }
    }

    /**
     * metodos para las transacciones
     */

    public function begin_transaction()
    {
        $this->getDb()->begin_transaction();
    }

    public function commit_transaction()
    {
        $this->getDb()->commit_transaction($result = true);
    }


    /**
     * metodo que devuelve los atributos del row  con los nombres de los campos del query
     */

    public function getRowFields()
    {

        if (method_exists($this->getDb(), 'rowFields'))

            return $this->getDb()->rowFields();

        else die("error: Method 'getRowFields' is not implemented for: " . $this->dbms);
    }
}
