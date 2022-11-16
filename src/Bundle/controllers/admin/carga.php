<?php

use App\Base\View;
use App\Libs\Calendar;
use App\Libs\ObjectDB;
use App\Libs\Security;
use App\Libs\FactoryDao;

function _carga() {

     Security::hasPermissionTo("admin");
     $roundID = Security::getSessionVar("RONDA");
     
     $date = Calendar::getDatabaseDateTime();
     $currentDate = date("d/m h:i:A");
    
     $db = new ObjectDB();
     $db->setSql(FactoryDao::getMatchesToday($roundID, $date));
     $db->executeQuery();
     
     $db->close();

     $urls = [
        "apply" => $_ENV['BASE_URL'] . "admin/aplicar",
        "index" => $_ENV['BASE_URL'] . "main/index",
     ];
     
    $data['siteTitle'] = $_ENV['APP_NAME'] . ' Carga de resultados';
    $data['body'][] = View::do_fetch(VIEW_PATH . 'admin/load.php',array("matches" => $db, "date" => $currentDate, "urls" => $urls));
    View::do_dump(LAYOUT_PATH . 'layout.php', $data);
}