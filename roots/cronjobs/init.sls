cron:
    service.running:
        - name: cron
        - enable: True

root_crontab:
    file.managed:
        - name: /var/spool/cron/crontabs/root
        - source: salt://cronjobs/crontabs
        - template: jinja

index_placing:
    file.managed:
        - name: /var/www/html/index.html
        - source: salt://cronjobs/index.html
        - template: jinja


