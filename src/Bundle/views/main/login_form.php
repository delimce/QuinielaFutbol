<script>
    $(function() {
        $("#user").click(function() {
            $("#mensaje").html('&nbsp;');
        });

        $("#clave").click(function() {
            $("#mensaje").html('&nbsp;');
        });

        $("#submit").click(function() {

            if (!$("#form1").valid()) {
                return false;
            }

            let formData = $("#form1").serialize();

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

<article class="grid">
    <div>
        <hgroup>
            <h1>Sign in</h1>
            <h2>A minimalist layout for Login pages</h2>
        </hgroup>
        <form name="form1" id="form1">
            <input type="text" id="user" name="user" placeholder="Login" aria-label="Login" autocomplete="nickname" required="">
            <input type="password" id="clave" name="clave" placeholder="Password" aria-label="Password" autocomplete="current-password" required="">
            <fieldset>
                <label for="remember">
                    <input type="checkbox" role="switch" id="remember" name="remember">
                    Remember me
                </label>
            </fieldset>
            <div class="form-error" id="mensaje">&nbsp;</div>
            <button type="submit" id="submit" class="contrast" onclick="event.preventDefault()">Entrar</button>
        </form>
    </div>
    <div class="login-image">
        <img src="../images/wc2022.png">
    </div>
</article>