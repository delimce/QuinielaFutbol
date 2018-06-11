<script src="../../../jscripts/jquery.velocity.min.js" type="text/javascript"></script>
<script src="../../../jscripts/velocity.ui.js" type="text/javascript"></script>

<script>

 $("div")
    .velocity("transition.slideLeftIn", { stagger: 250 })
    .delay(750)
    .velocity({ opacity: 0 }, 750);

</script>

<article class="module width_full">
    <div style="width: 90%">
        <div style="float: left">
            <img style="width: 130px; padding: 20px" onclick="location.replace('<?= Front::myUrl("main/index") ?>')" src="<?= Front::myUrl('images/zabivaka_full.png') ?>"></h1>
        </div>
        <div>
            <table style="max-width: 370px; min-width: 290px; text-align: center" border="0" cellspacing="1" cellpadding="1">
                <thead>
                    <tr>
                        <th>Usuario</th>
                        <th>Puntos</th>
                    </tr>
                </thead>
                <tbody>
                    <?php while ($row = $lista->getRowFields()) { ?>
                        <tr>
                            <td style="text-align: left; padding-left: 20px"><?= $row->nombre ?></td>
                            <td><?= $row->puntos ?></td>
                        </tr>
                        <tr>
                            <td></td>
                            <td></td>
                        </tr>
                    <?php } ?>
                </tbody>
            </table>
        </div>
        <p class="backi"><a href="javascript:history.back();">regresar</a></p>
    </div>
</article>
