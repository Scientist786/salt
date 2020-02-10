install_apache2:
    pkg.installed:
        - pkgs:
            - apache2
            - libapache2-mod-php

apache_conf:
    file.managed:
        - name: /etc/apache2/apache2.conf
        - source: salt://apache2/apache2.conf
        - template: jinja

enable_cgi:
    cmd.run:
        - name: sudo a2enmod cgi
        
start_apache2:
    cmd.run:
        - name: service apache2 restart
