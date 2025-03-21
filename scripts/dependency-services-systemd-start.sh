#!/bin/sh

# Use systemd to start the services Freeciv-web depends on. Put this script
# in configuration.sh's DEPENDENCY_SERVICES_START variable to use it.

systemctl is-active --quiet nginx.service || systemctl start nginx.service
systemctl is-active --quiet php5-fpm.service || systemctl start php5-fpm.service
systemctl is-active --quiet tomcat8.service || systemctl start tomcat8.service
