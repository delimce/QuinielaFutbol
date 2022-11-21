<?php

namespace App\Libs;

/**
 * Created by IntelliJ IDEA.
 * User: delimce
 * Date: 7/18/12
 * Time: 9:52 PM
 * To change this template use File | Settings | File Templates.
 */
class FactoryDao
{

    /**
     * para hacer login de usuario al iniciar programa
     * @param type $user
     * @param type $pass
     * @return type
     */
    static public function getLoginData($user, $pass)
    {

        return "select * from usuario where usuario = '$user' and clave = md5('$pass')";
    }

    static public function getMatches($ronda, $usuario)
    {

        return "SELECT
            (select concat(e.nombre,'_',e.bandera) from equipo e where e.id = p.equipo1_id) AS e1,
            (select concat(e.nombre,'_',e.bandera) from equipo e where e.id = p.equipo2_id) AS e2,
            p.fecha,
            date_format(p.fecha,'%d/%m') as fecha2,
            up.marcador1,
            up.marcador2,
            p.equipo1_id,
            p.equipo2_id,
            p.id as idp
            FROM
            partido AS p
            LEFT JOIN usuario_partido AS up ON (up.partido_id = p.id and up.usuario_id = $usuario)
            WHERE
            p.ronda_id = $ronda
            ORDER BY
            p.fecha ASC
            ";
    }

    // @todo: score when user belong to multiple groups doesn't work
    static public function getRanking()
    {

        return "SELECT
                u.id,
                concat(u.nombre,' (',u.pais,')') as nombre,
                sum(up.puntaje) as puntos, 
                group_concat(distinct gu.grupo_id) as grupos
                FROM
                usuario AS u
                INNER JOIN usuario_partido AS up ON up.usuario_id = u.id
                LEFT JOIN grupo_usuario gu ON gu.usuario_id = u.id
                GROUP BY
                u.id
                order by puntos desc";
    }


    static public function getRankingByGroup($group)
    {
        $sanitizeGroup = stripslashes($group);

        return "SELECT
                u.id,
                concat(u.nombre,' (',u.pais,')') as nombre,
                sum(up.puntaje) as puntos, 
                group_concat(distinct gu.grupo_id) as grupos
                FROM
                usuario AS u
                INNER JOIN usuario_partido AS up ON up.usuario_id = u.id
                INNER JOIN grupo_usuario gu ON gu.usuario_id = u.id
                WHERE gu.grupo_id = $sanitizeGroup
                GROUP BY
                u.id
                order by puntos desc";
    }

    static public function getMatchesToday($ronda)
    {

        return "SELECT
                (select concat(e.nombre,'_',e.bandera) from equipo e where e.id = p.equipo1_id) AS e1,
                (select concat(e.nombre,'_',e.bandera) from equipo e where e.id = p.equipo2_id) AS e2,
                p.fecha,
                date_format(p.fecha,'%d/%m') as fecha2,
                p.equipo1_id,
                p.equipo2_id,
                p.marcador1,
                p.marcador2,
                p.id as idp
                FROM
                partido AS p
                WHERE
                p.ronda_id = $ronda  and p.estatus = 1
                ORDER BY
                p.fecha ASC ";
    }

    /**
     * @param int $userId
     * @param int $roundId
     * 
     * @return string
     */
    static public function getDashboard(int $userId, int $roundId)
    {
        return "
        select 
        count(*) as total,
        DATEDIFF(now(),min(p.fecha)) as days,
        count(up.usuario_id) as filled
        from partido p 
        left join usuario_partido up on (p.id = up.partido_id and up.usuario_id = $userId)
        where p.ronda_id = $roundId
        group by p.ronda_id
        ";
    }


    /**
     * @return string
     */
    static public function getGroups()
    {
        return "SELECT
                g.id,
                g.nombre
                FROM
                grupo AS g
                ORDER BY
                g.nombre ASC";
    }

    // get groups by user
    static public function getGroupsByUser($userId)
    {
        return "SELECT
                g.id,
                g.nombre
                FROM
                grupo AS g
                INNER JOIN grupo_usuario AS ug ON ug.grupo_id = g.id
                WHERE
                ug.usuario_id = $userId
                ORDER BY
                g.nombre ASC";
    }

    // get timezone by country
    static public function getTimezoneByCountry($country)
    {
        return sprintf("SELECT t.timezone 
         FROM timezone AS t
         WHERE LOCATE(LOWER('%s'), t.country) > 0 and t.default = 1 limit 1", stripslashes($country));
    }

    // get users
    static public function getUsers()
    {
        return "SELECT
                u.id,
                u.nombre,
                u.pais,
                u.email,
                group_concat(distinct g.nombre) as grupos,
                count( DISTINCT up.usuario_id, up.partido_id ) AS loaded,
                sum(up.puntaje) as score
                    FROM
                        usuario AS u
                        LEFT JOIN usuario_partido up ON up.usuario_id = u.id 
                        LEFT JOIN grupo_usuario gu ON gu.usuario_id = u.id
                        LEFT JOIN grupo g ON g.id = gu.grupo_id
                    GROUP BY
                        u.id";
    }

    // get user by id
    static public function getUserById($userId)
    {
        return "SELECT
                u.id,
                u.nombre,
                u.email
                FROM
                usuario AS u
                WHERE u.id = $userId";
    }
}
