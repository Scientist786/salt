remove_hwclock:
    pkg.removed:
        - name: fake-hwclock
    cmd.run:
        - name: sudo update-rc.d -f fake-hwclock remove

configure_clock:
    file.managed:
        - name: /lib/udev/hwclock-set
        - source: salt://rtc/hwclock-set
        - template: jinja

set_date:
    cmd.run:
        - name: sudo date -s "{{ grains['rtc_date'] }}"
        - name: sudo hwclock -w

#process_completed:
#    cmd.run:
#        - name: sudo reboot

