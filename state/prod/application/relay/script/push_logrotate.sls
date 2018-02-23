push logrotate config file for nginx-tool:
  file.managed:
    - name: /etc/logrotate.d/nginx
    - source: salt://application/relay/files/logrotate.d/nginx
    - mode: 644
    - user: root
    - group: root
