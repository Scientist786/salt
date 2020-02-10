get_salt_code:
    git.latest:
        - name: github.com:Scientist786/salt.git
        - branch: master
        - rev: master
        - target: /home/solartel/salt
        - user: solartel
        - force_clone: True
        - force_reset: True
        - force_checkout: True

/home/solartel/salt:
    file.directory:
        - user: solartel
        - group: users
        - file_mode: 640
        - dir_mode: 750
        - recurse:
            - user
            - group
            - mode

