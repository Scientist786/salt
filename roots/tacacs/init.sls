tac_server:
    pkg.installed:
        - pkgs:
            - tacacs+

configuration:
    file.managed:
        - name: /etc/tacacs+/tac_plus.conf
        - source: salt://tacacs/tac_plus.conf
        - template: jinja    
    
