QuinielaFutbol
==============

Aplicacion para jugar quinielas de futbol elaborada en PHP con MYSQL

<b>Instrucciones para la Instalacion</b>

Por defecto para este momento la aplicacion esta configurada para el mundial
de futbol actual (Rusia 2018) para la rapida instalacion manual se recomienda
lo siguiente:

1. asegurate que el modulo de apache2 mod_rewrite esta activo, para ello debes hacer lo siguiente:
ejecuta el comando: "sudo a2enmod rewrite" luego ve al archivo de configuracion del apache ubicado en segun sea el caso: 
/etc/apache2/sites-enabled/000-default
y cambia todos los valores  de: AllowOverride None a: AllowOverride All.

2. en el php.ini debe configurarse de manera de que el php ignore los errores de tipo e_notice: quedando algo como:
error_reporting = E_ALL & ~E_DEPRECATED & ~E_NOTICE & ~E_STRICT



