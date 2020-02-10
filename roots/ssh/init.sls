ssh_progress_message:
    cmd.run:
        - name: /usr/bin/curl -X GET http://localhost:8080/api/saltmessage?message=Configuring+SSH.

solartel_ssh_config:
    file.managed:
        - name: /home/solartel/.ssh/config
        - source: salt://ssh/config
        - template: jinja

known_hosts:
    file.managed:
        - name: /home/solartel/.ssh/known_hosts
        - source: salt://ssh/known_hosts
        - template: jinja
