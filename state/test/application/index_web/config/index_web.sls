push index_web.env file:
  file.managed:
    - name: /tmp/index_web.env
    - source: salt://application/index_web/files/index_web.env.jinja
    - mode: 644
    - user: root
    - group: root
    - template: jinja
