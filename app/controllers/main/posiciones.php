<?php

function _posiciones() {

    Security::sessionActive();

         $rondaID = Security::getSessionVar("RONDA");
          
     
      $db = new ObjectDB();
      
      $db->setTable("ronda");
      $db->getTableFields("ronda", "id = $rondaID");
      $rondaName = $db->getField("ronda");
      
      
      $db->setSql(FactoryDao::getRanking($rondaID));
      $db->executeQuery();
    

    $data['siteTitle'] = Security::getSessionVar("TITTLE").' Posiciones de la Polla';
    $data['body'][] = View::do_fetch(VIEW_PATH . 'main/ranking.php', array("lista" => $db,"ronda"=>$rondaName));
    View::do_dump(LAYOUT_PATH . 'layout.php', $data);
    
    $db->close();
}