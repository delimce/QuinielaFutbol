<?php
//llama dinamicamente a todas las clases siempre y cuando tengan el mismo nombre del archivo .php para php5
//carga las clases de la carpeta core y vendor, las core son las clases hechas por el autor del framework




spl_autoload_register(function ($class) {
 	$path =  "/../lib/core/";
    include (__DIR__ . $path . $class . '.php');
});


?>