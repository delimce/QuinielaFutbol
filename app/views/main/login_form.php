<script>
    $(document).ready(function() {

        $('#form1').validate({
            rules: {
                user: {
                    required: true
                },
                clave: {
                    required: true
                }

            },
            errorElement: "div"
        });


        $("#user").click(function() {

            $("#mensaje").html('&nbsp;');
        });

        $("#clave").click(function() {

            $("#mensaje").html('&nbsp;');
        });


        $("#submit").click(function() {

            //validando
            if (!$("#form1").valid())
                return false;

            var formData = $("#form1").serialize();

            $.ajax({
                type: "POST",
                url: "<?= Front::myUrl('main/login'); ?>",
                cache: false,
                data: formData,
                success: function(data) {
                    data = $.trim(data);
                    if (data > 0) {
                        $(location).attr('href', '<?= Front::myUrl('main/index'); ?>');
                    } else {
                        $("#mensaje").html('<div class="warning">Error de usuario ó contraseña</div>');

                    }
                }
            });

            return false;
        });


        $("#registro").click(function() {

            var url = "<?= Front::myUrl('registro/nuevo'); ?>";
            $(location).attr('href', url);

        });

    });
</script>


<section style="max-width: 450px;">

    <!-- end of stats article --><!-- end of content manager article --><!-- end of messages article -->

    <article class="module width_full">


        <h1><img src="<?= Front::myUrl('images/wc2018.png') ?>"></h1>
        <div class="module_content">
            <form name="form1" id="form1">
                <fieldset>
                    <label for="user">Usuario:</label>
                    <input id="user" name="user">
                </fieldset>
                <fieldset>
                    <label for="clave">Clave:</label>
                    <input id="clave" name="clave" type="password">
                </fieldset>
            </form>
            <div id="mensaje">&nbsp;</div>

            <br>
            <input id="submit" type="submit" value="Entrar" style="width:80px;" class="alt_btn">
            <button id="registro" style="width:80px;" class="alt_btn">Registrate!!</button>
        </div>
        <footer>
            <div style="margin-top:8px;" align="center">
                ©&nbsp;<?= date("Y") . " Disfruta del mundial con tus panas" ?> 
            </div>
        </footer>


    </article>




</section>