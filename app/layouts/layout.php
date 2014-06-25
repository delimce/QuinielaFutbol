<!doctype html>
<html lang="es">
    <head>
        <?php include_meta(); ?>
        <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
        <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
        <!--[if lt IE 9]>
          <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
          <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
        <![endif]-->
        <style type="text/css">
            @import "<?= Front::myUrl('css/ie.css') ?>";
            @import "<?= Front::myUrl('css/layout.css') ?>";
        </style>
        <?php include_javascripts(); ?>
        <script type="text/javascript">
            $(document).ready(function()
            {
                $(".tablesorter").tablesorter();

            }
            );

        </script>
        <script type="text/javascript">
            $(function() {
                $('.column').equalHeight();
            });
        </script>
        <?php echo (isset($head) && is_array($head)) ? implode("\n", $head) : '' ?>
        <title><?php echo $siteTitle ?></title>
    </head>

    <body>
        <header id="header">

            <div style="float: end" class="opcion_user">
                <p class="user_name"><?= Security::getUserName() ?></p>
                <p class="logout_user"><a href="<?= Front::myUrl('main/logout') ?>">Cerrar</a></p>
            </div>

        </header> <!-- end of header bar -->

      
        <section>

            <?php echo (isset($body) && is_array($body)) ? implode("\n", $body) : '' ?>

        </section>


    </body>





</html>
