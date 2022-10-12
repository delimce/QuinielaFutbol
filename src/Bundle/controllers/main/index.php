<?php

use App\Base\View;
use App\Libs\ObjectDB;
use App\Libs\Security;
use App\Libs\FactoryDao;

function _index()
{
    Security::sessionActive();
    $data['siteTitle'] = $_ENV['APP_NAME'] . ' Home';

    $roundID = Security::getSessionVar("RONDA");

    $db = new ObjectDB();
    $db->setTable("ronda");
    $db->getTableFields("ronda", "id = $roundID");
    $roundName = $db->getField("ronda");
    $userId = Security::getUserID();

    # dashboard data
    $db->setSql(FactoryDao::getDashboard($userId, $roundID));
    $db->getResultFields();

    $dashboard = [
        "total"  => $db->getField("total"),
        "days"   => $db->getField("days"),
        "filled" => $db->getField("filled"),
    ];

    $isAdmin = Security::getUserProfileName() === "admin";

    $urls = [
        "index"     => $_ENV['BASE_URL'] . "main/index",
        "rules"     => $_ENV['BASE_URL'] . "juego/reglas",
        "play"      => $_ENV['BASE_URL'] . "juego/carga",
        "positions" => $_ENV['BASE_URL'] . "main/posiciones",
        "results"   => $_ENV['BASE_URL'] . "main/resultados",
        "load"      => $_ENV['BASE_URL'] . "admin/carga",
    ];

    $data['body'][] = View::do_fetch(VIEW_PATH . 'main/index_view.php', ["ronda" => $roundName, "urls" => $urls, "admin" => $isAdmin, "dash" => $dashboard]);
    View::do_dump(LAYOUT_PATH . 'layout.php', $data);
    $db->close();
}
