{% set prefix = "/opt/nginx-tool/conf" %}

push nginx.conf file:
  file.managed:
    - name: {{ prefix }}/nginx.conf
    - source: salt://application/relay/files/nginx.conf.jinja
    - mode: 644
    - user: root
    - group: root
    - template: jinja
