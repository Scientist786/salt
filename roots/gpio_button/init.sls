listening_service:
    file.managed:
        - name: /home/solartel
        - source: salt://gpio_button/edge.py

init_service:    
    file.managed:
        - name: /etc/systemd/system/edge.service
        - source: salt://gpio_button/edge.service
    service.running:
        - name: edge.service
        - enable: True
        - restart: True
