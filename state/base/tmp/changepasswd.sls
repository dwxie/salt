push changepasswd.sh script:
  file.managed:
    - name: /opt/changepasswd.sh
    - source: salt://changepasswd.sh
    - mode: 755
    - user: root
    - group: root

exec changepasswd.sh for root|megaium:
  cmd.run:
    - name: ./changepasswd.sh
    - cwd: /opt
    - only:
      - test -x /opt/changepasswd.sh

absent changepasswd.sh script:
  file.absent:
    - name: /opt/changepasswd.sh
    - onlyif:
      - test -f /opt/changepasswd.sh
