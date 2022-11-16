<?php

use App\Base\View;
use App\Libs\Calendar;
use App\Libs\ObjectDB;
use App\Libs\Security;
use App\Libs\FactoryDao;

function _carga()
{
    Security::sessionActive();
    $roundID = Security::getSessionVar("RONDA");
    $db = new ObjectDB();

    $db->setTable("ronda");
    $db->getTableFields("ronda", "id = $roundID");
    $roundName = $db->getField("ronda");

    $currentDate = date("d/m h:i:A");
    $timezoneObject = getTimezoneByCountry(Security::getUserCountry());

    $db->setSql(FactoryDao::getMatches($roundID, Security::getUserID()));
    $db->executeQuery();

    $urls = [
        "index" => $_ENV['BASE_URL'] . "main/index",
        "save"  => $_ENV['BASE_URL'] . "juego/save",
    ];

    $data['siteTitle'] = $_ENV['APP_NAME'] . ' Mi Quiniela';
    $data['body'][] = View::do_fetch(
        VIEW_PATH . 'play/form.php',
        ["matches" => $db, "ronda" => $roundName, "fecha" => $currentDate, "urls" => $urls, "timezone" => $timezoneObject]
    );
    View::do_dump(LAYOUT_PATH . 'layout.php', $data);

    $db->close();
}

//valida si hay tiempo para apostar
function isInTime(string $match): bool
{
    $diffInHour = Calendar::diffTime($match);
    //print_r($diffInHour);
    return ($diffInHour >= MIN_HOUR_TO_BET);
}

function setHour(string $date, DateTimeZone $timezone): string
{
    $d = new DateTimeImmutable($date);

    $local = $d->setTimezone($timezone);

    $dateConverted = $local->format('H:i');
    return changeHourFormat($dateConverted);
}

// change hour format from 24 to 12
function changeHourFormat(string $hourIn24): string
{
    return  date("h:i A", strtotime($hourIn24));
}

// get timezone by country
function getTimezoneByCountry(string $country): DateTimeZone
{
    $db = new ObjectDB();
    $db->setSql(FactoryDao::getTimezoneByCountry($country));
    $db->getResultFields();
    $timezone = $db->getNumRows() == 0 ? "America/Mexico_City" : $db->getField("timezone");
    $db->close();
    $tzo = new DateTimeZone($timezone);
    return $tzo;
}
