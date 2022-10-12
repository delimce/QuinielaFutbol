<div>
    <div class="main-img">
        <img onclick="location.replace('<?= $urls['index'] ?>')" src="../images/laeeb_full.png"></h1>
    </div>
    <div>
        <article class="dashboard">
            <span>Faltan: </span><span class="featured"><?= abs($dash['days']) ?></span><span> días para el mundial</span><br>
            <span>Resultados cargados: </span><span class="featured"><?= $dash['filled'] . '/' . $dash['total'] ?></span><br>
            <br>
            <a href="<?= $urls['play'] ?>" role="button" class="contrast">Cargar</a>
            <p>&nbsp;</p>
            <?php if ($admin) { ?>
                    <span>Sólo admin:</span>
                    <span><a href="<?= $urls['load'] ?>">Cargar datos Reales</a></span>
            <?php } ?>
        </article>
    </div>
    <p>&nbsp;</p>

</div>