<article>
    <div>
        <div style="float: left">
            <img style="width: 130px; padding: 20px" onclick="location.replace('<?= $urls['index'] ?>')" src="../images/laeeb_full.png"></h1>
        </div>
        <div>
            <table>
                <thead>
                    <tr>
                        <th>&nbsp;</th>
                        <th>Usuario</th>
                        <th>Puntos</th>
                    </tr>
                </thead>
                <tbody>
                    <?php $pos = 1; ?>
                    <?php while ($user = $users->getRowFields()) { ?>
                        <tr class="<?= ($userId === $user->id) ? 'selected' : 'none' ?>">
                            <td><?= $pos++ ?></td>
                            <td><?= $user->nombre ?></td>
                            <td><?= $user->puntos ?></td>
                        </tr>
                    <?php } ?>
                </tbody>
            </table>
        </div>
        <p class="backi"><a href="javascript:history.back();">regresar</a></p>
    </div>
</article>