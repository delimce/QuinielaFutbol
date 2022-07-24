QuinielaFutbol
==============

## Aplicación para jugar quinielas de futbol elaborada en PHP con MYSQL

> Proyecto mantenido desde el 2012 dudas o sugerencias usar telegram: @delimce

### Instrucciones para la Instalación

La aplicación tiene dos formas de instalar:
1.  Usando docker **(Recomendable)** 
2.  Servidor modo stand alone

## Opción 1:
Por defecto, la aplicación esta configurada para el mundial
de futbol actual (Qatar 2022) para la instalación automatica se recomienda
lo siguiente:

    1. Lanzar: docker-compose up --build
    2. Al terminar de instalar ir al navegador y abrir: http://localhost:8082
    3. Podrás loguearte usando user: admin, password: admin (puedes cambiar esto más tarde)


## Opción 2:
1. Debes tener un entorno con php (>=7.0) y mysql >= 5.6 instalado, usando como servidor web Apache 2.4.x
2. Asegúrate que el módulo de apache2 mod_rewrite está activo, para ello debes hacer lo siguiente:
    ejecuta el comando: ``sudo a2enmod rewrite`` luego ve al archivo de configuración del apache ubicado en segun sea el caso: 
    /etc/apache2/sites-enabled/000-default y cambia todos los valores  de: ``AllowOverride None`` a: ``AllowOverride All``.
3. El nombre del directorio de la aplicación debe coincidir con el nombre que esta registrado en el archivo .htaccess y en el config/setup.php por ejemplo:
 ``define("WEB_FOLDER", '/qatar2022/'); //CARPETA CONTENEDORA.``
4. Restaurar la base de datos ubicada en ``/docker/mysql/worldcup.sql``

## Muy importante para la ejecución:
 1. Asegúrate la hora de los partidos en tu país según el calendario FIFA para que esten sincronizados con la fecha en que tus usuarios puedan hacer sus apuestas, recuerda que el sistema deja modificar la quiniela sólo hasta una hora antes del partido.
 
 2. crea un nuevo usuario y modifica en la base de datos el Rol o perfil del mismo a "admin" para que solo tu puedas entrar a cargar las información de los partidos reales. (Resultados)

 3. Los ficheros de configuración  de todas las variables posibles se encuentran en: `` config/setup.php`` y ``config/dataSources.php``





