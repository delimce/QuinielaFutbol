<?php

use App\Base\View;
use App\Libs\ObjectDB;
use App\Libs\Security;
use App\Libs\FactoryDao;

function _posiciones()
{

  Security::sessionActive();
  $roundID = Security::getSessionVar("RONDA");



  $group = getGroupByURL();
  $selected = isset($group) ? $group : '';

  $db = new ObjectDB();
  $db->setTable("ronda");
  $db->getTableFields("ronda", "id = $roundID");
  $roundName = $db->getField("ronda");
  $userGroups = getUserGroupsByUserId(Security::getUserID());

  $mySql = ($group == '') ? FactoryDao::getRanking() : FactoryDao::getRankingByGroup($group);

  $db->setSql($mySql);
  $db->executeQuery();

  $urls = [
    "ranking" => $_ENV['BASE_URL'] . "main/posiciones",
    "index" => $_ENV['BASE_URL'] . "main/index",
  ];

  $data['siteTitle'] = $_ENV['APP_NAME'] . ' Posiciones de la ronda';
  $data['body'][] = View::do_fetch(VIEW_PATH . 'main/ranking.php', [
    "users" => $db,
    "round" => $roundName,
    "urls" => $urls,
    "selectedGroup" => $selected,
    "groups" => $userGroups,
    "userId" => Security::getUserID()
  ]);
  View::do_dump(LAYOUT_PATH . 'layout.php', $data);

  $db->close();
}


/**
 * @param string $userID
 * @return array
 */
function getUserGroupsByUserId(string $userID): array
{
  $db = new ObjectDB();
  $db->setSql(FactoryDao::getGroupsByUser($userID));
  $db->executeQuery();
  $groups = [];

  if ($db->getNumRows() === 0) {
    return $groups;
  }

  while ($row = $db->getRowFields()) {
    $temp = [
      "id" => $row->id,
      "name" => $row->nombre,
    ];
    $groups[] = $temp;
  }
  $db->close();
  return $groups;
}


/**
 * @return int
 */
function getGroupByURL(): int
{
  $url = (isset($_SERVER['HTTPS']) && $_SERVER['HTTPS'] === 'on' ? "https" : "http") . "://$_SERVER[HTTP_HOST]$_SERVER[REQUEST_URI]";
  $group = basename($url);
  return intval($group);
}
