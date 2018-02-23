push s1.sh file:
  file.managed:
    - name: /opt/nginx-tool/sbin/s1.sh
    - source: salt://application/relay/files/s1.sh
    - mode: 755
    - user: root
    - group: root
    - onlyif:
      - test -d /opt/nginx-tool/sbin
