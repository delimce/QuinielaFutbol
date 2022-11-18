<h1>Usuarios</h1>
<div>
<table>
        <thead>
            <tr>
                <th style="min-width: 230px;">Nombre</th>
                <th style="min-width: 200px;">email</th>
                <th>País</th>
                <th style="min-width: 200px;">Grupo</th>
                <th>Cargados</th>
                <th>Puntos</th>
                <th>&nbsp;</th>
            </tr>
        </thead>
        <tbody>
            <?php if ($users->getNumRows() > 0) { ?>
                <?php $pos = 1; ?>
                <?php while ($user = $users->getRowFields()) { ?>
                    <tr>
                        <td class="full-name"><?= $user->nombre ?></td>
                        <td><?= $user->email ?></td>
                        <td><?= $user->pais ?></td>
                        <td><?= $user->grupos ?></td>
                        <td><?= $user->loaded ?>/48</td>
                        <td><?= $user->score ?></td>
                        <td>
                            <a href="<?= $urls['detail'] ?>/<?= $user->id ?>" class="contrast">Quiniela</a>
                        </td>
                    </tr>
                <?php } ?>
            <?php } ?>

        </tbody>
    </table>
</div>