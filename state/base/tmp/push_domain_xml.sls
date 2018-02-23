push crossdomain xml:
  file.managed:
    - name: /opt/nginx-tool/html/crossdomain.xml
    - source: salt://files/crossdomain.xml
    - mode: 755
    - user: root
    - group: root
