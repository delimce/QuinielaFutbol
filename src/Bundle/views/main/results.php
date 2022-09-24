<article class="module width_full">

    <div style="float: left;">
        <img style="width: 130px; padding: 20px" onclick="location.replace('main/index')" src="../images/laeeb_full.png"></h1>
    </div>
    <span style="text-height: 30px">Fecha actual: <b><?= $date ?></b></span>

    <table align="center" border="0" style="text-align: center; width: 400px; height: 120px">
        <?php
        $tempDate = "";

        while ($row = $partidos->getRowFields()) {
            $team1 = explode("_", $row->e1);
            $name1 = $team1[0];
            $band1 = $team1[1];
            $team2 = explode("_", $row->e2);
            $name2 = $team2[0];
            $band2 = $team2[1];

            ////grupo por fecha 
            $date2 = $row->fecha2;
        ?>

            <?php
            if ($date2 != $tempDate) {
                echo "<tr><td colspan='8'><p><b>Jornada: $date2<b></p></td></tr>";
                $tempDate = $date2;
            }
            ?>

            <tr>
                <td style="text-align: right"><?= $name1 ?></td>
                <td><img src="../'images/band/'<?= $band1 ?>"></td>
                <td class="cell-disable"><?= $row->marcador1 ?></td>
                <td><b>Vs</b></td>
                <td class="cell-disable"><?= $row->marcador2 ?></td>
                <td><img src="../images/band/<?= $band2 ?>"></td>
                <td style="text-align: left"><?= $name2 ?></td>
            </tr>
        <?php } ?>

    </table>
    <p>&nbsp;</p>
    <p class="backi"><a href="javascript:history.back();">regresar</a></p>

</article>