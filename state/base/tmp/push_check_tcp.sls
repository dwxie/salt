push check_tcp.sls:
  file.managed:
    - name: /tmp/check_tcp.sh
    - source: salt://tmp/check_tcp.sh
    - mode: 755
    - user: root
    - group: root 
