<!doctype html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://unpkg.com/@picocss/pico@latest/css/pico.min.css">
    <title>Hello, world!</title>
  </head>
  <body>
    <main class="container">
    <?php echo (isset($body) && is_array($body)) ? implode("\n", $body) : '' ?>
    </main>
  </body>
</html>
