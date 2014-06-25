<?php

/**
 * Created by IntelliJ IDEA.
 * User: delimce
 * Date: 7/18/12
 * Time: 9:52 PM
 * To change this template use File | Settings | File Templates.
 */
class FactoryDao {

    /**
     * para hacer login de usuario al iniciar programa
     * @param type $user
     * @param type $pass
     * @return type
     */
    static public function getLoginData($user, $pass) {

        return "select * from usuario where usuario = '$user' and clave = md5('$pass')";
    }

    static public function getMatches($ronda, $usuario) {

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

    static public function getRanking($ronda) {

        return "SELECT
                concat(u.nombre,' (',u.contacto,')') as nombre,
                sum(up.puntaje) as puntos
                FROM
                usuario AS u
                INNER JOIN usuario_partido AS up ON up.usuario_id = u.id
                where up.ronda_id = $ronda 
                GROUP BY
                u.id
                order by puntos desc";
    }
    
    
     static public function getMatchesToday($ronda,$fecha) {

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
                p.ronda_id = $ronda and p.fecha <= '$fecha'
                ORDER BY
                p.fecha ASC ";
                    }
    
    
    

}
