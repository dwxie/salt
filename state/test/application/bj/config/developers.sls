push developers.env file:
  file.managed:
    - name: /var/www/developers.env
    - source: salt://application/bj/files/developers.env.jinja
    - mode: 644
    - user: root
    - group: root
    - template: jinja
