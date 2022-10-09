<?php

use App\Libs\Front;
use App\Libs\Security;

?>
<!doctype html>
<html lang="es">

<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="<?=$_ENV['BASE_URL'] ?>/css/custom.css">
  <link rel="stylesheet" href="https://unpkg.com/@picocss/pico@latest/css/pico.min.css">
  <script src="https://code.jquery.com/jquery-2.2.4.min.js" integrity="sha256-BbhdlvQf/xTY9gja0Dq3HiwQF8LaCRTXxZKRutelT44=" crossorigin="anonymous"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.19.5/jquery.validate.min.js"></script>
  <title><?= $siteTitle ?></title>
</head>

<body>
  <div class="header">
    <hgroup>
      <h5><?= Security::getUserName() ?></h5>
      <h4><a href="<?= Front::myUrl('main/logout') ?>">Cerrar sesión</a></h4>
    </hgroup>
  </div>
  <main class="container">
    <?php echo (isset($body) && is_array($body)) ? implode("\n", $body) : '' ?>
    <div class="footer">
      <?= FOOTER_TEXT ?>
    </div>
  </main>
</body>
</html>