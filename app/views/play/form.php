<script>
    $(document).ready(function() {

        $("#submit").click(function() {
            $("#mensaje").html('&nbsp');
            var formData = $("#form1").serialize();
            $.ajax({
                type: "POST",
                url: "<?= Front::myUrl('juego/save'); ?>",
                cache: false,
                data: formData,
                success: function(data) {
                    $("#mensaje").html('<b>Completado con exito</b>');
                }
            });
            return false;
        });
    });
</script>

<article class="module width_full">

    <div style="float: left">
        <img style="width: 130px; padding: 20px" onclick="location.replace('<?= Front::myUrl("main/index") ?>')" src="<?= Front::myUrl('images/laeeb_full.png') ?>"></h1>
    </div>
    <span style="text-height: 30px; font-weight: bolder; font-size: 16px; padding: 20px"><?= $ronda ?></span><br>
    <span style="text-height: 30px">Fecha actual: <b><?= $fecha ?></b></span>
    <form name="form1" id="form1">
        <table align="center" border="0" style="text-align: center; width: 350px">
            <?php
            $tempDate = "";

            while ($row = $partidos->getRowFields()) {
                $team1 = explode("_", $row->e1);
                $name1 = $team1[0];
                $flag1 = $team1[1];
                $team2 = explode("_", $row->e2);
                $name2 = $team2[0];
                $flag2 = $team2[1];

                ////grupo por fecha 
                $date2 = $row->fecha2;
            ?>

                <?php
                if ($date2 != $tempDate) {
                    echo "<tr><td colspan='6'><p><b>Jornada: $date2<b></p></td></tr>";
                    $tempDate = $date2;
                }
                ?>
                <tr>
                    <td style="text-align: right"><?= $name1 ?></td>
                    <td><img src="<?= Front::myUrl('images/band/' . $flag1) ?>"></td>
                    <td>
                        <?php if (!isInTime($row->fecha)) { ?>
                            <span class="cell-disable"><?= $row->marcador1 ?></span>
                        <?php } else { ?>
                            <input type="number" min="0" max="15" name="<?= $row->idp . "_m1" ?>" value="<?= $row->marcador1 ?>" style="width: 35px; text-align: center">
                        <?php } ?>
                    </td>
                    <td><b>Vs</b></td>
                    <td>
                        <?php if (!isInTime($row->fecha)) { ?>
                            <span class="cell-disable"><?= $row->marcador2 ?></span>
                        <?php } else { ?>
                            <input type="number" min="0" max="15" name="<?= $row->idp . "_m2" ?>" value="<?= $row->marcador2 ?>" style="width: 35px; text-align: center">
                        <?php } ?>
                    </td>
                    <td><img src="<?= Front::myUrl('images/band/' . $flag2) ?>"></td>
                    <td style="text-align: left"><?= $name2 ?></td>
                </tr>
            <?php } ?>
            <tr>
                <td colspan='6'>
                    <div style="text-align: center; margin-top: 14px; width: auto">
                        <input id="submit" type="submit" value="Guardar" style="width:120px; font-size: 15px" class="alt_btn">
                    </div>
                    <div id="mensaje"></div>
                </td>
            </tr>
        </table>
        <p>&nbsp;</p>
        <input type="hidden" name="fechaAct" id="fechaAct" value="<?= Calendar::getDatabaseDateTime() ?>">
    </form>
</article>