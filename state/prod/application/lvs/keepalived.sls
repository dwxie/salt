# keepalived
{% set prefix = '/etc/keepalived' %}
{% set configFile = '/etc/keepalived/keepalived.conf' %}

apt install keepalived:
  cmd.run:
    - name: apt-get install -y keepalived
    - cwd: /root
    - onlyif:
      - test ! -f /usr/sbin/keepalived


create {{ prefix }} folder:
  file.directory:
    - name: {{ prefix }}
    - user: root
    - group: root
    - dir_mode: 755
    - makedirs: true
    - onlyif:
      - test ! -d {{ prefix }}


push keepalived config file:
  file.managed:
    - name: {{ configFile }}
    - source: salt://application/lvs/files/keepalived.conf.jinja
    - mode: 644
    - user: root
    - group: root
    - template: jinja
