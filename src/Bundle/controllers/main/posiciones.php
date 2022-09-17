<?php

use App\Base\View;
use App\Libs\ObjectDB;
use App\Libs\Security;
use App\Libs\FactoryDao;

function _posiciones()
{

  Security::sessionActive();
  $roundID = Security::getSessionVar("RONDA");

  $db = new ObjectDB();
  $db->setTable("ronda");
  $db->getTableFields("ronda", "id = $roundID");
  $roundName = $db->getField("ronda");

  $db->setSql(FactoryDao::getRanking());
  $db->executeQuery();

  $data['siteTitle'] = Security::getSessionVar("TITTLE") . ' Posiciones de la Polla';
  $data['body'][] = View::do_fetch(VIEW_PATH . 'main/ranking.php', array("lista" => $db, "ronda" => $roundName));
  View::do_dump(LAYOUT_PATH . 'layout.php', $data);

  $db->close();
}
