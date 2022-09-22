<script>
    $(function() {

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

            if (!$("#form1").valid())
                return false;
            var formData = $("#form1").serialize();

            $.ajax({
                type: "POST",
                url: '<?= $urls['login'] ?>',
                cache: false,
                data: formData,
                error: function() {
                    $("#mensaje").html('Something went wrong, please try again.');
                },
                success: function(data) {
                    data = $.trim(data);
                    console.log(data);
                    if (data > 0) {
                        $(location).attr('href', '<?= $urls['index'] ?>');
                    } else {
                        $("#mensaje").html('<div class="warning">Error de usuario o contraseña</div>');

                    }
                }

            });

            return false;
        });


        $("#registro").click(function() {
            $(location).attr('href', '<?= $urls['register'] ?>');

        });

    });
</script>


<section>
    <article>
        <h1 style="text-align:center"><img src="../images/wc2022.png"></h1>
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

            <div style="color:yellow" id="mensaje">&nbsp;</div>

            <br>
            <input id="submit" type="submit" value="Entrar">
            <button id="registro">Registrate!!</button>
        </div>
        <footer>
            <div style="margin-top:8px;">
                ©&nbsp;<?= date("Y") . " Disfruta del mundial jugando la quiniela" ?>
            </div>
        </footer>
    </article>
</section>