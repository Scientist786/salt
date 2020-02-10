restore_ip:
    file.managed:
        - source: salt://gpio_button/dhcpcd.conf
        - name: /etc/dhcpcd.conf
        - template: jinja
    file.managed:
        - name: /home/solartel
        - source: salt://gpio_button/ip.sh
    cmd.run:
        - name: /home/solartel/ip.sh

