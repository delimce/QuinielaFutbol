<script>
    $(document).ready(function() {
        $("#submit").click(function() {
            $("#mensaje").html('&nbsp');
            var formData = $("#form1").serialize();
            $.ajax({
                type: "POST",
                url: "<?= $urls['save'] ?>",
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

<article>
    <form name="form1" id="form1">
        <table>
            <tbody class="results">
                <?php
                $tempDate = "";
                while ($match = $matches->getRowFields()) { ?>
                    <?php
                    $team1 = explode("_", $match->e1);
                    $name1 = $team1[0];
                    $flag1 = $team1[1];
                    $team2 = explode("_", $match->e2);
                    $name2 = $team2[0];
                    $flag2 = $team2[1];
                    # group by date d/m
                    $date2 = $match->fecha2;
                    if ($date2 != $tempDate) {
                        echo "<tr><td colspan='7'><h3>Jornada: $date2</h3><td></tr>";
                        $tempDate = $date2;
                    }
                    ?>
                    <tr>
                        <td class="load-team"><?= $name1 ?></td>
                        <td class="load-flag"><img src="../images/band/<?= $flag1 ?>" alt=""></td>
                        <td class="load-result"><input class="result" maxlength="2" type="number" name="<?= $match->idp . "_m1" ?>" value="<?= $match->marcador1 ?>"></td>
                        <td class="load-vs"><b>Vs</b></td>
                        <td class="load-result"><input class="result" maxlength="2" type="number" name="<?= $match->idp . "_m2" ?>" value="<?= $match->marcador2 ?>"></td>
                        <td class="load-flag"><img src="../images/band/<?= $flag2 ?>" alt=""></td>
                        <td class="load-team"><?= $name2 ?></td>
                    <tr>
                    <?php } ?>
            </tbody>
        </table>
        <div>
            <input id="submit" type="submit" class="contrast" value="Guardar">
        </div>

        <div class="show-msg" id="mensaje"></div>
    </form>
</article>
<p>&nbsp;</p>