<?php

use App\Base\View;
use App\Libs\ObjectDB;
use App\Libs\Security;
use App\Libs\FactoryDao;

function _quiniela()
{
    Security::hasPermissionTo("admin");

    $user = getUserByUrl();
    $rondaId = Security::getSessionVar("RONDA");

    $name = getUserById($user);


    $urls = [
        "detail"    => $_ENV['BASE_URL'] . "admin/quiniela",
    ];

    $db = new ObjectDB();
    $db->setSql(FactoryDao::getMatches($rondaId, $user));
    $db->executeQuery();
    $db->close();
    $data['body'][] = View::do_fetch(VIEW_PATH . 'admin/play.php', [
        "matches" => $db,
        "urls" => $urls,
        "name" => $name
    ]);
    View::do_dump(LAYOUT_PATH . 'layout.php', $data);
}

/**
 * @return int
 */
function getUserByUrl(): int
{
  $url = (isset($_SERVER['HTTPS']) && $_SERVER['HTTPS'] === 'on' ? "https" : "http") . "://$_SERVER[HTTP_HOST]$_SERVER[REQUEST_URI]";
  return (int) basename($url);
}

// get User by id
function getUserById($id)
{
    $db = new ObjectDB();
    $db->setSql(FactoryDao::getUserById($id));
    $db->getResultFields();
    $userName = $db->getField("nombre");
    $db->close();
    return $userName;
}