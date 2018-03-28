<div style="width: 90%">
    <div style="float: left">
         <img onclick="location.replace('<?= Front::myUrl("main/index") ?>')" src="<?= Front::myUrl('images/zabivaka_full.png') ?>"></h1>
    </div>
    <div style="float: left">
    <ul>
        <li><h1><a href="<?= Front::myUrl("juego/reglas") ?>">Reglas de juego</a></h1></li>
        <li><h1><a href="<?= Front::myUrl("juego/polla") ?>">Mi Quiniela</a></h1></li>
        <li><h1><a href="<?= Front::myUrl("main/posiciones") ?>">Posiciones de los usuarios</a></h1></li>
        <li><h1><a href="<?= Front::myUrl("main/resultados") ?>">Resultados reales</a></h1></li>
        <?php if(Security::getUserProfileName()=="admin"){ ?>
        <li><h1><a href="<?= Front::myUrl("admin/carga") ?>" style="color: blue">Cargar datos Reales</a></h1></li>
        <?php } ?>
    </ul>
    </div>
    
</div>
