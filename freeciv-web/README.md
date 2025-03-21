Freeciv web application 
=======================

This is the Freeciv web application, which consists of the Java servlets 
and filters for running the web client, JSP templates, javascript code
and other web content. There are also some PHP files in the meta directory
which should be served with a PHP server.

Tomcat 8 + nginx + PHP-FPM setup
================================
Freeciv-web supports the Tomcat 8 application server for hosting the Java web application.
The PHP files in this webapp can be hosted using nginx and PHP-FPM 
(FastCGI Process Manager). 

The build scripts are updated to build Freeciv-web for Tomcat by default,
so setting up Freeciv-web with Vagrant will configure this automatically.
Also see the suggested nginx.conf file in publite2/nginx.conf

  https://tomcat.apache.org/  
  http://nginx.org/  
  http://php-fpm.org/  

Instead of serving PHP files with PHP-FPM, possibly also Apache2 with mod_php can be used. 

Resin
=====
The Resin 4 webapp server can also host Freeciv-web, both the Java webapp,
JSP and PHP files. This setup is deprecated, but could work with some manual config.
  http://caucho.com/

Build script
============
Use maven to build and deploy, by running this build script: 
sh build.sh

The build script will also create a data webapp directory where savegames and scorelogs are stored.

Flyway migrations of the database is supported. Remember to set the mysql password in pom.xml. To migrate the database to the latest version, run this Maven command:
mvn compile flyway:migrate


The following files contains MySQL username and password, and must be set manually
if you are not using vagrant:

freeciv-web/src/main/webapp/META-INF/context.html  
freeciv-web/src/main/webapp/meta/php_code/local.php.dist  (rename to local.php)  
freeciv-web/src/main/webapp/WEB-INF/web.xml        (contains capcha secret for pbem)  


Copyright (C) 2007-2016 Andreas Røsdal. 
Released under the GNU AFFERO GENERAL PUBLIC LICENSE.

