QuinielaFutbol
==============

Aplicacion para jugar quinielas de futbol elaborada en PHP con MYSQL

<b>Instrucciones para la Instalación</b>

Por defecto, la aplicación esta configurada para el mundial
de futbol actual (Qatar 2022) para la rápida instalación manual se recomienda
lo siguiente:

1. asegurate que el módulo de apache2 mod_rewrite esta activo, para ello debes hacer lo siguiente:
ejecuta el comando: "sudo a2enmod rewrite" luego ve al archivo de configuración del apache ubicado en segun sea el caso: 
/etc/apache2/sites-enabled/000-default
y cambia todos los valores  de: AllowOverride None a: AllowOverride All.

2. en el php.ini debe configurarse de manera de que el php ignore los errores de tipo e_notice: quedando algo como:
error_reporting = E_ALL & ~E_DEPRECATED & ~E_NOTICE & ~E_STRICT

## Muy importante para la ejecución:

1. el nombre del directorio de la aplicacion debe coincidir con el nombre que esta registrado en el archivo .htaccess y en el config/setup.php por ejemplo:
 define("WEB_FOLDER", '/russia2018/'); //CARPETA CONTENEDORA.

 2. fijate la hora de los partidos en tu pais segun el calendario FIFA para que esten sincronizados con la fecha en que tus usuarios puedan hacer sus apuestas, recuerda que el sistema deja modificar la quiniela sólo hasta una hora antes del partido.
 
 3. crea un nuevo usuario y modifica en la base de datos el Rol o perfil del mismo a "admin" para que solo tu puedas entrar a cargar las información de los partidos reales. (Resultados)





