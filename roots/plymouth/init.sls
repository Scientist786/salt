theme_download:
    file.recurse:
        - source:
          - salt://plymouth/plcn
        - name: /usr/share/plymouth/themes/plcn
        - template: jinja
        - file_mode: keep

apply_theme:
    cmd.run:
        - name: plymouth-set-default-theme plcn -R
