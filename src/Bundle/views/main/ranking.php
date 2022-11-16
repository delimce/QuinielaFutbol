<h1>Posiciones</h1>
<aside>
    <hgroup>
        <h4>Filtrar por grupo:</h4>
        <select name="group-select" id="group-select">
            <option value="">General</option>
            <?php
            foreach ($groups as $group) {
                $selected = $group['id'] == $selectedGroup ? 'selected' : '';
                echo "<option value='{$group['id']}' $selected>{$group['name']}</option>";
            }
            ?>
        </select>
    </hgroup>
</aside>
<div>
    <table>
        <thead>
            <tr>
                <th>&nbsp;</th>
                <th>Usuario</th>
                <th class="show-msg">Puntos</th>
            </tr>
        </thead>
        <tbody>
            <?php if ($users->getNumRows() > 0) { ?>
                <?php $pos = 1; ?>
                <?php while ($user = $users->getRowFields()) { ?>
                    <tr class="<?= ($userId == $user->id) ? 'user-selected' : 'none' ?>">
                        <td><?= $pos++ ?></td>
                        <td class="full-name"><?= $user->nombre ?></td>
                        <td class="show-msg"><?= $user->puntos ?></td>
                    </tr>
                <?php } ?>
            <?php } ?>

        </tbody>
    </table>
</div>

<script>
    $('#group-select').on('change', function() {
        let group = $(this).val();
        let url = '<?= $urls['ranking'] ?>';
        if (group !== '') {
            url += `/group/${group}`;
        }
        window.location.href = url;
    });
</script>