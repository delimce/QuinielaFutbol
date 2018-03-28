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
        <img style="width: 130px; padding: 20px" onclick="location.replace('<?= Front::myUrl("main/index") ?>')" src="<?= Front::myUrl('images/zabivaka_full.png') ?>"></h1>
    </div>
    <span style="text-height: 30px"><?= $ronda ?></span><br>
    <span style="text-height: 30px">Fecha actual: <b><?= $fecha ?></b></span>
    <form name="form1" id="form1">
        <table align="center" border="0" style="text-align: center; width: 350px">
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
                    echo "<tr><td colspan='6'><p><b>Jornada: $fecha2<b></p></td></tr>";
                    $fechatemp = $fecha2;
                }
                ?>


                <tr>
                    <td style="text-align: right"><?= utf8_encode($nombre1) ?></td>
                    <td><img src="<?= Front::myUrl('images/band/' . $bandera1) ?>"></td>
                    <td><input type="number" min="0" max="15" name="<?= $row->idp . "_m1" ?>" <?php if(!isInTime($row->fecha)) echo 'readonly' ?>  value="<?= $row->marcador1 ?>" style="width: 35px; text-align: center"></td>
                    <td><b>Vs</b></td>
                    <td><input type="number" min="0" max="15" name="<?= $row->idp . "_m2" ?>" <?php if(!isInTime($row->fecha)) echo 'readonly' ?> value="<?= $row->marcador2 ?>" style="width: 35px; text-align: center"></td>
                    <td><img src="<?= Front::myUrl('images/band/' . $bandera2) ?>"></td>
                    <td style="text-align: left"><?= utf8_encode($nombre2) ?></td>
                </tr>
            <?php } ?>
            <tr><td colspan='6'>
                    <div style="text-align: center; margin-top: 14px; width: auto">
                        <input id="submit" type="submit" value="Guardar" style="width:80px;" class="alt_btn">
                        <button id="registro" style="width:80px;" class="alt_btn">Imprimir</button>
                    </div>
                    <div id="mensaje"></div>
                </td>
            </tr>
        </table>
        <p>&nbsp;</p>
        <input type="hidden" name="fechaAct" id="fechaAct" value="<?=Calendar::getDatabaseDateTime()?>">
    </form>
</article>