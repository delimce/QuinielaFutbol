<h1><?= $ronda ?></h1>
<div class="dashboard">
    <?php if ($dash['days'] < 0) { ?>
        <span>Faltan: </span><span class="featured"><?= abs($dash['days']) ?></span><span> días para el mundial</span><br>
    <?php } ?>
    <span>Resultados cargados: </span><span class="featured"><?= $dash['filled'] . '/' . $dash['total'] ?></span><br>
    <br>
    <a href="<?= $urls['play'] ?>" role="button" class="contrast">Cargar</a>
    <p>&nbsp;</p>
    <?php if ($admin) { ?>
        <span>Sólo admin:</span>
        <span><a href="<?= $urls['load'] ?>">Cargar datos Reales</a></span>
    <?php } ?>
</div>
<p>&nbsp;</p>