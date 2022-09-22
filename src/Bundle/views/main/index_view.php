<div style="width: 90%">
    <div style="float: left">
        <img onclick="location.replace('<?= $urls['index'] ?>')" src="../images/laeeb_full.png"></h1>
    </div>
    <div style="float: left">
        <ul>
            <li>
                <h1><a href="<?= $urls['rules'] ?>">Reglas de juego</a></h1>
            </li>
            <li>
                <h1><a href="<?= $urls['play'] ?>">Mi Quiniela</a></h1>
            </li>
            <li>
                <h1><a href="<?= $urls['positions'] ?>">Posiciones de los usuarios</a></h1>
            </li>
            <li>
                <h1><a href="<?= $urls['results'] ?>">Resultados reales</a></h1>
            </li>
            <?php if ($admin) { ?>
                <li>
                    <h1><a href="<?= $urls['load'] ?>" style="color: blue">Cargar datos Reales</a></h1>
                </li>
            <?php } ?>
        </ul>
    </div>
    <p>&nbsp;</p>

    <div style="margin: 30px; font-size: 16px; display: inline-block"><br>
        <span style="text-transform: uppercase; font-weight: bolder">Pote acumulado (<?= $ronda ?>)</span><br>
    </div>

</div>