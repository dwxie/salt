create sa_tools if not exists:
  file.directory:
    - name: /opt/sa_tools/scripts/sh
    - makedirs: True
    - dir_mode: 777

copy block 10022  except jump server script to remote:
  file.managed:
    - name: /opt/sa_tools/scripts/sh/make_sure_only_jump_can_login.sh
    - source: salt://base/files/make_sure_only_jump_can_login.sh
    - mode: 755
    - user: root
    - group: root
    - onlyif:
      - test -d /opt/sa_tools/scripts/sh

copy delete 10022  script to remote:
  file.managed:
    - name: /opt/sa_tools/scripts/sh/delete_block_10022_firewall.sh
    - source: salt://base/files/delete_block_10022_firewall.sh
    - mode: 755
    - user: root
    - group: root
    - onlyif:
      - test -d /opt/sa_tools/scripts/sh

add block 10022 crontab task to crontab:
  cmd.script:
    - source: salt://base/files/add_crontab_block_10022.sh
