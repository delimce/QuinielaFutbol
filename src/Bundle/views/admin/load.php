<script>
    function processGame(match, result1, result2) {

        let r1 = $("#" + result1).val();
        let r2 = $("#" + result2).val();
        $.ajax({
            type: "POST",
            url: "<?= $urls['apply'] ?>",
            cache: false,
            data: 'idp=' + match + '&r1=' + r1 + '&r2=' + r2,
            success: function(data) {
                $("#" + match + "mensaje").html('<b>Aplicado!</b>');
            }
        });
    }
</script>

<article>

    <div style="float: left;">
        <img onclick="location.replace('<?= $urls['index'] ?>')" src="../images/laeeb_full.png"></h1>
    </div>

    <div style="padding: 11px; font-size: 23px"><b>Nota:</b>Para poder cargar los resultados Reales, debe haber pasado la fecha del partido</div>
    <span style="text-height: 30px">Fecha actual: <b><?= $date ?></b></span>

    <p>&nbsp;</p>

    <form name="form1" id="form1">
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
                echo "<h3>Jornada: $date2</h3>";
                $tempDate = $date2;
            }
            ?>
            <figure>
                <table>
                    <tbody>
                        <tr>
                            <td class="load-team"><?= $name1 ?></td>
                            <td class="load-flag"><img src="../images/band/<?= $flag1 ?>" alt=""></td>
                            <td class="load-result"><input class="result" maxlength="2" type="number" id="<?= $match->idp . "_m1" ?>" value="<?= $match->marcador1 ?>"></td>
                            <td class="load-vs"><b>Vs</b></td>
                            <td class="load-result"><input class="result" maxlength="2" type="number" id="<?= $match->idp . "_m2" ?>" value="<?= $match->marcador2 ?>"></td>
                            <td class="load-flag"><img src="../images/band/<?= $flag2 ?>" alt=""></td>
                            <td class="load-team"><?= $name2 ?></td>
                            <td>
                                <input type="button" class="contrast" onclick="processGame(<?= $match->idp ?>, '<?= $match->idp . '_m1' ?>', '<?= $match->idp . '_m2' ?>')" value="Aplicar">
                            </td>
                            <td>
                                <div id="<?= $match->idp ?>mensaje">&nbsp;</div>
                            </td>
                        <tr>
                    </tbody>
                </table>
            </figure>

        <?php } ?>

        <div class="show-msg" id="mensaje"></div>
    </form>

    <p>&nbsp;</p>
</article>