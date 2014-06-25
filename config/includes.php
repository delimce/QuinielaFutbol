<?php

/*
 * archivo para añadir includes al layout, vistas o controladores ext
 */


/*
 * añade archivos en javascript
 */

function include_javascripts() {

    echo '<script type="text/javascript" src="' . Front::myUrl('jscripts/jquery-1.8.2.min.js') . '"></script>';
    echo '<script type="text/javascript" src="' . Front::myUrl('jscripts/jquery.validate.min.js') . '"></script>';
    echo '<script type="text/javascript" src="'.Front::myUrl('jscripts/hideshow.js').'" ></script>';
    echo '<script type="text/javascript" src="'.Front::myUrl('jscripts/jquery.tablesorter.min.js').'" ></script>';
    echo '<script type="text/javascript" src="'.Front::myUrl('jscripts/jquery.equalHeight.js').'"></script>';

    /*

      echo '<script type="text/javascript" src="'.Front::myUrl('jscripts/jquery.validate.min.js').'"></script>';
      echo '<script type="text/javascript" src="'.Front::myUrl('jscripts/additional-methods.min.js').'"></script>';
      echo '<script type="text/javascript" src="'.Front::myUrl('jscripts/jquery.dataTables.js').'"></script>';
      echo '<script type="text/javascript" src="'.Front::myUrl('jscripts/TableTools.js').'"></script>';
      echo '<script type="text/javascript" src="'.Front::myUrl('jscripts/jquery-ui.js').'"></script>';
     */
}

function include_meta() {

    echo '<meta name="viewport" content="width=device-width, initial-scale=1">';
    echo '<meta charset="utf-8">';
}

?>
