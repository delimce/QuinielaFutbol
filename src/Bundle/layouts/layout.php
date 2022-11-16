<?php

use App\Libs\Front;
use App\Libs\Security;

?>
<!doctype html>
<html lang="es">

<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="<?= $_ENV['BASE_URL'] ?>/css/custom.css">
  <link rel="stylesheet" href="<?= $_ENV['BASE_URL'] ?>/css/menu.css">
  <link rel="stylesheet" href="https://unpkg.com/@picocss/pico@latest/css/pico.min.css">
  <script src="https://code.jquery.com/jquery-2.2.4.min.js" integrity="sha256-BbhdlvQf/xTY9gja0Dq3HiwQF8LaCRTXxZKRutelT44=" crossorigin="anonymous"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.19.5/jquery.validate.min.js"></script>
  <title><?= $siteTitle ?></title>
</head>

<body>
  <header class="header">
    <span class="logo"><a href="<?= $_ENV['BASE_URL'] ?>"><img src="<?= IMAGES_PATH.'/wc2022.png'?>"></a></span>
    <span class="full-name"> <?= Security::getUserName() ?>&nbsp;|&nbsp;<a href="<?= Front::myUrl('main/logout') ?>">Cerrar</a></span>
    <details>
      <summary>Lista de opciones</summary>
      <ol>
        <li><a href="<?= $_ENV['BASE_URL'] ?>">Home</a></li>
        <li><a href="<?= Front::myUrl('juego/reglas') ?>">Reglas</a></li>
        <li><a href="<?= Front::myUrl('juego/carga') ?>">Quiniela</a></li>
        <li><a href="<?= Front::myUrl('main/posiciones') ?>">Posiciones</a></li>
        <li><a href="<?= Front::myUrl('main/resultados') ?>">Resultados</a></li>
      </ol>
    </details>
  </header>
  <main class="container">
    <div class="content">
      <p>&nbsp;</p>
      <?php echo (isset($body) && is_array($body)) ? implode("\n", $body) : '' ?>
    </div>
    <div class="footer">
      <?= FOOTER_TEXT ?>
    </div>
  </main>
</body>

</html>