<?php
/**
 * Created by IntelliJ IDEA.
 * User: delimce
 * Date: 7/19/12
 * Time: 11:49 AM
 * To change this template use File | Settings | File Templates.
 */
interface TemplateDB
{


    //////getters y setters
    public function setStmt($stmt);

    public function getStmt();

    public function setDbc($dbc);

    public function getDbc();

    public function setResult($result);

    public function getResult();


    /*
    *  metodo para conectarse a la base de datos
    */
    public function connect($host, $port, $user, $pwd, $schema, $database);

    /*
    *  metodo para cerrar la conexion
    */
    public function close();


    /*
     * realiza un query simple (no seguro)
     */
    public function simpleQuery($sql);

    /*
     * metodo para prearar sql seguro
     */
    public function prepareQuery($sql);

    /*
     *  setea un parametro de valor al query prepared
     */
    public function setParam($types, $params);

    /*
     * ejecuta un query ya preparado
     */

    public function execute();

    /*
     * metodo para liberar el resultado de la ultima consulta
     */
    public function freeResult();

    /*
     * determina el numeor del iltimo id insertado
     */
    public function lastIdInserted();

    /*
     * determina el numero de registros que viene de un query
     */
    public function numOfRowsRequested();

    /*
    * trae la info del servidor db
    */
    public function getServerInfo();

    /*
     * valida los caracteres especiales a nivel del motor db
     */
    public function escapeString($value);
}

?>