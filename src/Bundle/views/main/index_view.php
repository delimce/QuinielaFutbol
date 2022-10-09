<div>
    <div class="main-img">
        <img onclick="location.replace('<?= $urls['index'] ?>')" src="../images/laeeb_full.png"></h1>
    </div>
    <div>
        <ul>
            <?php if ($admin) { ?>
                <li>
                    <h1><a href="<?= $urls['load'] ?>" style="color: blue">Cargar datos Reales</a></h1>
                </li>
            <?php } ?>
        </ul>
    </div>
    <p>&nbsp;</p>

</div>