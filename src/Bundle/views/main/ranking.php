<h1>Posiciones</h1>
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
            <?php if ($users->getRegNumber() > 0) { ?>
                <?php $pos = 1; ?>
                <?php while ($user = $users->getRowFields()) { ?>
                    <tr class="<?= ($userId === $user->id) ? 'selected' : 'none' ?>">
                        <td><?= $pos++ ?></td>
                        <td class="full-name"><?= $user->nombre ?></td>
                        <td><?= $user->puntos ?></td>
                    </tr>
                <?php } ?>
            <?php } ?>

        </tbody>
    </table>
</div>