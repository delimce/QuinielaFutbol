<script>
    function aplicarGame(partido, result1, result2) {

        var r1 = $("#" + result1).val();
        var r2 = $("#" + result2).val();
        $.ajax({
            type: "POST",
            url: "<?= Front::myUrl('admin/aplicar'); ?>",
            cache: false,
            data: 'idp=' + partido + '&r1=' + r1 + '&r2=' + r2,
            success: function(data) {
                $("#" + partido + "mensaje").html('<b>Aplicado!</b>');
            }
        });


    }

</script>

<article class="module width_full">

    <div style="float: left;">
        <img onclick="location.replace('<?= Front::myUrl("main/index") ?>')" src="<?= Front::myUrl('images/zabivaka_full.png') ?>"></h1>
    </div>

    <div style="padding: 11px; font-size: 23px"><b>Nota:</b>Para poder cargar los resultados Reales, debe haber pasado la fecha del partido</div>
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
                echo "<tr><td colspan='9'><p><b>Jornada: $fecha2<b></p></td></tr>";
                $fechatemp = $fecha2;
            }
            ?>

            <tr>
                <td style="text-align: right"><?= utf8_encode($nombre1) ?></td>
                <td><img src="<?= Front::myUrl('images/band/' . $bandera1) ?>"></td>
                <td><input type="number" min="0" max="15" id="<?= $row->idp . "_m1" ?>" value="<?= $row->marcador1 ?>" style="width: 35px; text-align: center"></td>
                <td><b>Vs</b></td>
                <td><input type="number" min="0" max="15" id="<?= $row->idp . "_m2" ?>" value="<?= $row->marcador2 ?>" style="width: 35px; text-align: center"></td>
                <td><img src="<?= Front::myUrl('images/band/' . $bandera2) ?>"></td>
                <td style="text-align: left"><?= utf8_encode($nombre2) ?></td>
                <td style="text-align: left">
                    <input id="<?= 'b1' . $row->idp ?>" type="submit" value="Aplicar" onclick="aplicarGame(<?= $row->idp ?>, '<?= $row->idp . "_m1" ?>', '<?= $row->idp . "_m2" ?>')" class="alt_btn">
                </td>
                <td><div id="<?= $row->idp ?>mensaje">&nbsp;</div></td>
            </tr>
        <?php } ?>

    </table>
    <p>&nbsp;</p>

</article>