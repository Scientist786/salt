#get_salt_code_1:
#    git.latest:
#        - name: git.repos.plc:salt.git
#        - branch: basic
#        - rev: basic
#        - target: /home/plc/salt
#        - user: plc
#        - force_fetch: True
#        - force_reset: True
#        - force_checkout: True
#        - force_clone: True

# get_backend:
#    git.latest:
#        - name: git.repos.plc:aque_backend.git
#        - branch: develop
#        - rev: develop
#        - target: /home/plc/sitelogic/aque_backend
#        - user: root
#        - force_fetch: True
#        - force_reset: True
#        - force_checkout: True
#        - force_clone: True 

get_backend:
    git.latest:
        - name: github.com:Scientist786/salt.git
        - target: /home/solartel/solartelemetry/
        - user: root
        - force_fetch: True
        - force_reset: True
        - force_checkout: True
        - force_clone: True

# get_frontend:
#    git.latest:
#        - name: git.repos.plc:aque_onsite.git
#        - branch: master
#        - rev: BETA
#        - target: /var/www/html/aque_onsite
#        - user: root
#        - force_fetch: True
#        - force_reset: True
#        - force_checkout: True
#        - force_clone: True #}

# /var/www/html/aque_onsite:
#    file.directory:
#        - user: root
#        - group: www-data
#        - file_mode: 640
#        - dir_mode: 755
#        - recurse:
#            - user
#            - group
#            - mode 

