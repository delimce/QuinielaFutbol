
<h1>Resultados</h1>
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
                    echo "<h3>Jornada: $date2</h3>";
                    $tempDate = $date2;
                }
                ?>

                <tr>
                    <td><?= $name1 ?></td>
                    <td><img src="../images/band/<?= $flag1 ?>" alt=""></td>
                    <td>
                        <h3><?= $match->marcador1 ?></h3>
                    </td>
                    <td><b>Vs</b></td>
                    <td>
                        <h3><?= $match->marcador2 ?></h3>
                    </td>
                    <td><img src="../images/band/<?= $flag2 ?>" alt=""></td>
                    <td><?= $name2 ?></td>
                <tr>
                <?php } ?>
        </tbody>
    </table>
    <p>&nbsp;</p>
