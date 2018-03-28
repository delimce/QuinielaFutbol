
<article class="module width_full">

    <div style="float: left;">
        <img style="width: 130px; padding: 20px" onclick="location.replace('<?= Front::myUrl("main/index") ?>')" src="<?= Front::myUrl('images/zabivaka_full.png') ?>"></h1>
    </div>
    <span style="text-height: 30px"><?= $ronda ?></span><br>
    <span style="text-height: 30px">Fecha actual: <b><?= $fecha ?></b></span>

    <table align="center" border="0" style="text-align: center; width: 400px; height: 120px">
        <?php
        $fechatemp = "";

        while ($row = $partidos->getRowFields()) {
            $equipo1 = explode("_", $row->e1);
            $nombre1 = $equipo1[0];
            $bandera1 = $equipo1[1];
            $equipo2 = explode("_", $row->e2);
            $nombre2 = $equipo2[0];
            $bandera2 = $equipo2[1];

            ////grupo por fecha 
            $fecha2 = $row->fecha2;
            ?>

            <?php
            if ($fecha2 != $fechatemp) {
                echo "<tr><td colspan='8'><p><b>Jornada: $fecha2<b></p></td></tr>";
                $fechatemp = $fecha2;
            }
            ?>

            <tr>
                <td style="text-align: right"><?= utf8_encode($nombre1) ?></td>
                <td><img src="<?= Front::myUrl('images/band/' . $bandera1) ?>"></td>
                <td><?= $row->marcador1 ?></td>
                <td><b>Vs</b></td>
                <td><?= $row->marcador2 ?></td>
                <td><img src="<?= Front::myUrl('images/band/' . $bandera2) ?>"></td>
                <td style="text-align: left"><?= utf8_encode($nombre2) ?></td>
            </tr>
        <?php } ?>

    </table>
    <p>&nbsp;</p>

</article>