<script>
    $(document).ready(function() {

        $('#form1').validate({
            rules: {
                r0nombre: {
                    required: true
                },
                r0usuario: {
                    required: true
                },
                r0contacto: {
                    required: true
                },
                r0email: {
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

            var url = "<?= Front::myUrl('main/login'); ?>";
            $(location).attr('href', url);

        });





        $("#submit").click(function() {

            //validando
            if (!$("#form1").valid())
                return false;

            var formData = $("#form1").serialize();
            $('#submit').attr('disabled', 'disabled');

            $.ajax({
                type: "POST",
                url: "<?= Front::myUrl('registro/save'); ?>",
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


<article class="module width_full">
    <header><h3>Nuevo Usuario</h3></header>

    <div class="module_content">
        <h1 style="text-align: left"><img src="<?= Front::myUrl('images/wc2018.png') ?>"></h1>
        <form name="form1" id="form1">
            <fieldset>
                <label for="r0nombre">Nombre completo:</label>
                <input id="r0nombre" name="r0nombre" value="">
            </fieldset>
            <fieldset>
                <label for="r0usuario">Usuario:</label>
                <input id="r0usuario" name="r0usuario" value="">
            </fieldset>

            <fieldset>
                <label for="r0email">Email:</label>
                <input id="r0email" name="r0email"  type="email" value="">
            </fieldset>
            
            <fieldset>
                <label for="r0contacto">Contacto: (empresa, grupo, etc)</label>
                <input id="r0email" name="r0contacto" value="">
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
            <input id="submit" type="submit" value="Guardar" class="alt_btn">
            <button id="ingreso" style="width:80px;" class="alt_btn">Login</button>
        </div>
    </footer>


</article>

