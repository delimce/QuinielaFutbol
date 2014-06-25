<?php
/******************************************************************
SUPER CLASE DATABASE
clase que crea todas las funciones necesarias para trabajr con bases de datos
desde su coneccion hasta cierre de la conexion
 ******************************************************************/
//nombre de la clase

abstract class Database2
{

    //**********************************************************************Atributos de la clase
    private $db_HOST; //nombre del host de base de datos
    private $db_USER; // user del sistema
    private $db_PASS; //  password
    private $dbase; // base de datos
    private $dbc; // variable de conexion
    private $result; /// atributo que tiene el resultado del query
    private $nreg; //// cantidad de registros insertados
    private $ultimoID; /// ultimo id insertado (auto incremental)
    /***********************************************************************metodos y propiedades*/

    /************************************************************************* PROPIEDADES ****/


    public function __construct()
    { ///constructor de la clase

        if ($this->dbc != null) $this->cerrar();
        $this->db_HOST = '';
        $this->db_USER = '';
        $this->db_PASS = '';
        $this->dbase = '';

    }

    //////////////////////////////////getters y setters
    /**
     * devuelve el n de registros consultados
     */
    public function getNreg()
    {

        return $this->nreg;

    }

    /**
     *devuelve el ultimo id insertado
     */
    public function getUltimoId()
    {

        return $this->ultimoID;

    }


//********************************************************cierra conexion y liberar recursos


    ///metodo para cerrar la conexion con la base de datos
    public function cerrar()
    { //cierra la conexion

        $this->liberar();
        mysqli_close($this->dbc);

    }

    ///metodo para liberar el objeto que retorna el valor del query
    public function liberar()
    { //cierra la conexion
        //  @mysqli_free_result($this->result);

        ///para liberar la conexion en el caso de usar stored procedures
        while (mysqli_more_results($this->dbc)) {
            if (mysqli_next_result($this->dbc)) {
                $this->result = mysqli_use_result($this->dbc);
                @mysqli_free_result($this->result);
            }
        }


    }


    ////autoconexion discreta segun los parametros y la base dedatos especificadas en el archivo de conf

    function autoconexion()
    {

        //estructura de autoconexion , variableS global de conexion a la db
        global $HOSTNAME;
        global $DBUSER;
        global $DBPASS;
        global $DATABASE;

        $this->conectar($HOSTNAME, $DBUSER, $DBPASS, $DATABASE);
    }


    ///permite utilizar la conexion a una database ya creada sin tener que reconectar;
    function recliclar_conexion($link)
    { ///enlace a la conexion abierta

        $this->dbc = $link;

    }


    //*****************************************************************************************ejecucion
    // metodo que ejecuta un query de creacion o modificacion o devuelve un error  el segundo parametro es para liberar el recurso de una vez
    //utilizado ideal para sentencias insert, update, delete etc

    public function query($sql, $lib = false)
    { // ejecuta un query o devuelve un error
        $this->result = @mysqli_query($this->dbc, $sql) or die('<font color=#FF0000> error en query: </font>' . mysqli_error($this->dbc));
        $this->nreg = $this->total_registros();

        if ($lib) $this->liberar();
    }


    ///funcion para obtener el valor del registro en tipo numero

    public function db_vector_num()
    {

        return @mysqli_fetch_row($this->result);

    }

    ////funcion para obtener el valor del registro en tipo cadena o nombre

    public function db_vector_nom()
    {

        return @mysqli_fetch_assoc($this->result);

    }


    /////funcion para setear el puntero: result a una posicion especifica
    public function setPointerResult($pos)
    {


        @mysqli_data_seek($this->result, $pos);

    }


    /// propiedad que cambia la conexion a una nueva database o server  con solo invocarla se
    //// cambia la conexion el ultimo parametro determina si la conexion es persistente o no.

    public function conectar($host, $user, $pwd, $db)
    {

        if ($this->dbc != null) $this->cerrar();
        $this->db_HOST = $host;
        $this->db_USER = $user;
        $this->db_PASS = $pwd;
        $this->dbase = $db;

        $this->dbc = mysqli_connect($this->db_HOST, $this->db_USER, $this->db_PASS, $this->dbase)  or die('<font color=#FF0000> conection failed: </font>' . mysqli_connect_error());

        //////////////


    }


    //// Metodo que retorna informacion del dbserver donde esta conectado el objeto

    public function dbserver_info()
    {
        printf("Datos de la conexi?n: %s\n", mysqli_get_host_info($this->dbc));
    }


    //// Metodo que retorna informacion del cliente, las librerias que se estan usando para conectarse con mysql

    public function dbclient_info()
    {
        printf("Datos del cliente mysql: %s\n", mysqli_get_client_info());
    }


    /////////////setea el ultimo Id de un insert

    public function setUltimoID($id)
    {

        $this->ultimoID = $id;

    }


    //// Metodo que retorna el ultimo id de de un insert

    public function ultimo_id()
    {
        return @mysqli_insert_id($this->dbc)or die('<font color=#FF0000> Error </font>' . mysqli_error($this->dbc));
    }


    public function numero_filas_afecc()
    { //retorna el numero de las filas afectadas por el ultimo query
        $tmp = mysqli_affected_rows($this->dbc);
        return ($tmp);
    }


    ///lista el numero de registros traidos en el ultimo query
    public function total_registros()
    {
        $tmp = @mysqli_num_rows($this->result);
        return ($tmp);
    }


//devuelve un arreglo con el nombre de los campos consultados enpezando desde la pos 0

    public function campos_query()
    {

        $x = 0;

        while ($finfo = mysqli_fetch_field($this->result)) {

            $resultado[$x] = $finfo->name;
            $x++;
        }

        return $resultado;

    }


    ///funcion que elimina la base de datos
    function borrar($dbase)
    { //elimina la base de datos
        return mysql_drop_db($dbase, $this->dbc);
    }


///**************************************** METODOS para insertar seguramente  */

// funcion que realiza un insert simple
// tabla, campos, valores y boqueo true o false (opcional)

    public function insertar($tabla, $campos, $valores, $block = false)
    {

        $valores2 = explode(",", $valores);

        for ($i = 0; $i < count($valores2); $i++) {

            $valor = mysqli_real_escape_string($this->dbc, $valores2[$i]); //// me aseguro de que no se inserten valores invalidos
            $valores2[$i] = "'$valor'";

        }


        $valores3 = implode(",", $valores2);

        $query = 'INSERT INTO ' . $tabla . ' (' . $campos . ') VALUES (' . $valores3 . ')';

        ////////////////// bloqueo de tabla
        if ($block) $this->query("LOCK TABLES " . $tabla . " WRITE");
        $this->query($query);
        $this->ultimoID = mysqli_insert_id($this->dbc);
        if ($block) $this->query("UNLOCK TABLES");

    }


    // funcion que realiza un insert simple de los valores ingresados en un vector
    // tabla, campos, valores y boqueo true o false (opcional)
    // esta funcion es una mejora de insertar 1 ya que previene errores si los valores poseen ,


    public function insertar2($tabla, $campos, $vector, $block = false)
    {


        for ($i = 0; $i < count($vector); $i++) {

            $valor = mysqli_real_escape_string($this->dbc, $vector[$i]); //// me aseguro de que no se inserten valores invalidos
            $vector[$i] = "'$valor'";
            $valores .= $vector[$i] . ',';
        }

        $valores = substr($valores, 0, strlen($valores) - 1); // elimina la , al final

        $query = 'INSERT INTO ' . $tabla . ' (' . $campos . ') VALUES (' . $valores . ')';

        ////////////////// bloqueo de tabla
        if ($block) $this->query("LOCK TABLES " . $tabla . " WRITE");
        $this->query($query);
        $this->ultimoID = mysqli_insert_id($this->dbc);
        if ($block) $this->query("UNLOCK TABLES");

    }


    // funcion que realiza un update simple de los valores y campos ingresados en un vector
    // tabla, campos(array), valores(array) where (condicion) y boqueo true o false (opcional)
    //  previene errores si los valores poseen ,


    public function update($tabla, $campos, $vector, $where, $block = false)
    {


        for ($i = 0; $i < count($vector); $i++) {

            $valor = mysqli_real_escape_string($this->dbc, $vector[$i]); //// me aseguro de que no se inserten valores invalidos
            $data = "$campos[$i] = '$valor'";
            $valores .= $data . ',';
        }

        $valores = substr($valores, 0, strlen($valores) - 1); // elimina la , al final
        if ($where != '') $where = "WHERE " . $where; ///// si se coloca una condicion


        $query = 'UPDATE ' . $tabla . ' SET ' . $valores . ' ' . $where;


        ////////////////// bloqueo de tabla
        if ($block) $this->query("LOCK TABLES " . $tabla . " WRITE");
        $this->query($query);
        if ($block) $this->query("UNLOCK TABLES");

    }


    ///////////////////////////////METODOS PARA TRANSACCIONES

    public function abrir_transaccion()
    {

        ////iniciando la transaccion
        mysqli_autocommit($this->dbc, FALSE);

    }


    public function cerrar_transaccion($result = true)
    {

        if ($result) mysqli_commit($this->dbc); else mysqli_rollback($this->dbc); ////finalizando la transaccion
        mysqli_autocommit($this->dbc, TRUE);
    }


}

; //fin de la super clase

?>