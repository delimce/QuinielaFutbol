<?php

/*
 * archivo para añadir includes al layout, vistas o controladores ext
 */


/*
 * añade archivos en javascript
 */

function include_javascripts() {

    echo '<script type="text/javascript" src="./jscripts/jquery-1.8.2.min.js"></script>';
    echo '<script type="text/javascript" src="./jscripts/jquery.validate.min.js"></script>';
    echo '<script type="text/javascript" src="./jscripts/hideshow.js"></script>';
    echo '<script type="text/javascript" src="./jscripts/jquery.tablesorter.min.js"></script>';
    echo '<script type="text/javascript" src="./jscripts/jquery.equalHeight.js"></script>';

}

function include_meta() {

    echo '<meta name="viewport" content="width=device-width, initial-scale=1">';
    echo '<meta charset="utf-8">';
}

?>
