<?php

/*
 * Clase para construir una tabla de datos basados en una consulta simple
 */

/**
 * Description of DataTable
 *
 * @author luis
 */
class DataTable {

    private $table;
    private $idTable;
    private $query;
    private $noRegMessage = "No se encontraron registros";

    function __construct($idTable) {

        $this->table = "";
        $this->idTable = $idTable;
    }

    public function setNoRegMessage($noRegMessage) {

        $this->noRegMessage = $noRegMessage;
    }

    public function setQuery($query) {

        $this->query = $query;
    }

    public function draw() {


        $db = new ObjectDB();
        $db->setSql($this->query);
        $db->executeQuery();

        if ($db->getNumRowsRequested() > 0) { ///si tengo datos que mostrar
            $fields = $db->getFieldsNames();

            $this->table.= "<div><table id=\"$this->idTable\" class=\"display\"><thead><tr>";
            ////campos
            foreach ($fields as $key => $value) {
                $this->table.="<th>" . $value . "</th>";
            }
            /////////

            $this->table.="</tr></thead>";


            $this->table.="<tbody>";

            ////valores
            while ($row = $db->getRegNumber()) {
                
                $this->table.="<tr>";
                foreach ($fields as $key => $value) {
                    $this->table.="<td>" . $row[$key] . "</td>";
                }
                $this->table.="</tr>";
            }
            ///////////

            $this->table.=" </tbody></table></div>";

            return $this->table;
        } else {
            return "<b>$this->noRegMessage</b>";
        }

        $db->freeResult();
        $db->close();
    }

}

?>
