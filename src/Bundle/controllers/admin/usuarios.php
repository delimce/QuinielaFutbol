<?php

use App\Base\View;
use App\Libs\ObjectDB;
use App\Libs\Security;
use App\Libs\FactoryDao;

function _usuarios()
{

    Security::hasPermissionTo("admin");

    $db = new ObjectDB();
    $db->setSql(FactoryDao::getUsers());
    $db->executeQuery();
    
    $db->close();


    $urls = [
        "detail"    => $_ENV['BASE_URL'] . "admin/quiniela",
    ];


    $data['body'][] = View::do_fetch(VIEW_PATH . 'admin/users.php', [
        "urls" => $urls,
        "users" => $db
    ]);
    View::do_dump(LAYOUT_PATH . 'layout.php', $data);
}
