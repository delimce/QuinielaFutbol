<script>
    $(document).ready(function() {

        $('#form1').validate({
            rules: {
                fullname: {
                    required: true
                },
                username: {
                    required: true
                },
                contact: {
                    required: true
                },
                email: {
                    email: true,
                    required: true
                },
                clave: {
                    required: true,
                    minlength: 4
                },
                clave2: {
                    required: true,
                    minlength: 4,
                    equalTo: "#clave"
                }
            },
            errorElement: "div"
        });


        $("#ingreso").click(function() {
            var url = "<?=$url['login']?>";
            $(location).attr('href', url);
        });


        $("#submit").click(function() {

            //validando
            if (!$("#form1").valid()){
                return false;
            }

            var formData = $("#form1").serialize();
            $('#submit').attr('disabled', 'disabled');

            $.ajax({
                type: "POST",
                url: "<?=$urls['save'] ?>",
                cache: false,
                data: formData,
                success: function(data, status) {
                    data = $.trim(data);

                    $("#mensaje").html(data);

                }
            });

            return false;
        });

    });
</script>


<article>
    <header><h3>Nuevo Usuario</h3></header>

    <div class="module_content">
        <h1 style="text-align: left"><img src="../images/wc2022.png"></h1>
        <form name="form1" id="form1">
            <fieldset>
                <label for="fullname">Nombre completo:</label>
                <input id="fullname" name="fullname" value="">
            </fieldset>
            <fieldset>
                <label for="username">Usuario:</label>
                <input id="username" name="username" value="">
            </fieldset>

            <fieldset>
                <label for="email">Email:</label>
                <input id="email" name="email"  type="email" value="">
            </fieldset>
            
            <fieldset>
                <label for="contact">Contacto: (empresa, grupo, etc)</label>
                <input id="email" name="contact" value="">
            </fieldset>

            <fieldset>
                <label for="clave">Contraseña:</label>
                <input id="clave" name="clave" type="password" value="">
            </fieldset>

            <fieldset>
                <label for="clave2">Repita contraseña:</label>
                <input id="clave2" name="clave2" type="password" value="">
            </fieldset>

            <div id="mensaje">&nbsp;</div>

            <br>
        </form> 
    </div>
    <footer>
        <div class="submit_link">
            <input id="submit" type="submit" value="Guardar">
            <button id="ingreso">Login</button>
        </div>
    </footer>
</article>