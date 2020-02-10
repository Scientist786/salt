required pckgs:
    pkg.installed:
        - pkgs:
            - libmodbus-dev
            - libconfig-dev
            - libjansson-dev
            - libudev-dev
            - libperl-dev
            - php7.3-sqlite
            - php-mysql
            - php-gettext
            - php7.3-mysql
            - make
            - xinit
            - libsqlite3-dev
dwnld_netsnmp:
    cmd.run:
        - user: root
        - cwd: /
        - name: wget http://sourceforge.net/projects/net-snmp/files/net-snmp/5.8/net-snmp-5.8.tar.gz

extrc_snmp:
    cmd.run:
        - user: root
        - cwd: /
        - name: tar -xvzf net-snmp-5.8.tar.gz

remv_tar:
    cmd.run:
        - name: root
        - cwd: /
        - name: rm -rf net-snmp-5.8.tar.gz
net_snmp:
    cmd.script:
        - user: root
        - name: snmp.sh
        - source: salt://net-snmp/snmp.sh

make_snmp:
    cmd.run:
        - user: root
        - cwd: /net-snmp-5.8/
        - name: |
            sudo make

make_install:
    cmd.run:
        - user: root
        - cwd: /net-snmp-5.8/
        - name: |
            sudo make install

soft_link:
    file.symlink:
        - name: /usr/lib/libnetsnmp.so.35
        - target: /usr/local/lib/libnetsnmp.so.35    

get_snmpd:
    pkg.installed:
        - pkgs:
            - snmpd
