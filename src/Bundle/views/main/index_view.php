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
        <ul>
            <li>
                <a href="<?= $urls['load'] ?>"  class="contrast">Cargar resultados reales</a>
            </li>
            <li>
                <a href="<?= $urls['users'] ?>" class="contrast">Administrar Usuarios</a>
            </li>
            </li>
        </ul>
    <?php } ?>
</div>
<p>&nbsp;</p>