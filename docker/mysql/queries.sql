-- schedule: 0 0 * * *
select p.id, concat(p.equipo1_id,' ', e1.nombre) , p.marcador1, concat(p.equipo2_id,' ', e2.nombre), p.marcador2,
 p.fecha, date_format(p.fecha,'%d/%m/%Y %h:%i %p') as fecha2
from partido p
inner join equipo e1 on p.equipo1_id = e1.id
inner join equipo e2 on p.equipo2_id = e2.id
where p.ronda_id = 1
order by p.fecha

-- users stadistics

SELECT
	u.id,
	u.nombre,
	u.usuario,
	u.pais,
	u.email,
	group_concat(distinct g.nombre) as grupos,
	u.fecha AS updated_at,
	count( DISTINCT ua.id ) AS access,
	DATE_FORMAT(max( ua.fecha ),'%a %d-%m') last_date,
	count( DISTINCT up.usuario_id, up.partido_id ) AS loaded
FROM
	usuario AS u
	LEFT JOIN accesos_log AS ua ON u.id = ua.`user`
	LEFT JOIN usuario_partido up ON up.usuario_id = u.id 
	LEFT JOIN grupo_usuario gu ON gu.usuario_id = u.id
	LEFT JOIN grupo g ON g.id = gu.grupo_id
GROUP BY
	u.id
 order by access desc


