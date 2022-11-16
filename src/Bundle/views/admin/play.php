<article>
    <figure>
        <p>
        <h3>Quiniela de <?= $name ?></h3>
        <hr>
        </p>

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
                        echo "<tr><td colspan='6'><h3>Jornada: $date2</h3><td></tr>";
                        $tempDate = $date2;
                    }
                    ?>

                    <tr class="match-line">
                        <td class="load-team"><?= $name1 ?></td>
                        <td class="load-flag"><img src="../../images/band/<?= $flag1 ?>" alt=""></td>
                        <td class="load-result">
                            <?= $match->marcador1 ?? '-' ?>
                        </td>
                        <td class="load-vs"><b>Vs</b></td>
                        <td class="load-result">
                            <?= $match->marcador2 ?? '-' ?>
                        </td>
                        <td class="load-flag"><img src="../../images/band/<?= $flag2 ?>" alt=""></td>
                        <td class="load-team"><?= $name2 ?></td>
                    <tr>
                    <?php } ?>
            </tbody>
        </table>
    </figure>
</article>