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
        <?php echo (isset($head) && is_array($head)) ? implode("\n", $head) : '' ?>
        <title><?php echo $siteTitle ?></title>
    </head>
    <body>
        <div style="text-align:center">
            <!-- end of header bar --><!-- end of secondary bar --><!-- end of sidebar -->
            <?php echo (isset($body) && is_array($body)) ? implode("\n", $body) : '' ?>
            <p>&nbsp;</p>
        </div>
    </body>
</html>