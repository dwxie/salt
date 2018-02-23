push s1.sh file:
  file.managed:
    - name: /opt/nginx-tool/sbin/s1.sh
    - source: salt://application/relay/files/nginx-tool/sbin/s1_mid.sh
    - mode: 755
    - user: root
    - group: root
    - onlyif:
      - test -d /opt/nginx-tool/sbin
