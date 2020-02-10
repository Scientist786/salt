radius_server:
    pkg.installed:
        - pkgs:
            - freeradius

ip_configuration:
    file.managed:
        - name: /etc/freeradius/3.0/clients.conf
        - source: salt://radius/clients.conf
        - template: jinja

user_configuration:
    file.managed:
        - name: /etc/freeradius/3.0/users    
        - source: salt://radius/users
        - template: jinja
