<?php

/**
 * Created by IntelliJ IDEA.
 * User: delimce
 * Date: 7/24/12
 * Time: 10:31 AM
 * To change this template use File | Settings | File Templates.
 */
$dataSources = [];


////estructura de conexion 
$dt1 = [
    "dbms"     => "Mysql",
    "host"     => "mysql-service",
    "port"     => "3306",
    "database" => "worldcup_db",
    "user"     => "root",
    "pwd"      => "root",
];

////asignacion
$dataSources["qatar"] = $dt1;
