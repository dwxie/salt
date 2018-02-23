{%set prefix = '/tmp/indexserver_test/etc' %}

create {{ prefix }} folder:
  file.directory:
    - name: {{ prefix }}
    - user: root
    - group: root
    - dir_mode: 755
    - makedirs: true

{% for queue_seq in pillar['indexserver']['RUN_QUEUE'] %}
push {{ prefix }}/server-{{ queue_seq }}.ini file:
  file.managed:
    - name: {{ prefix }}/indexserver-{{ queue_seq }}.ini
    - source: salt://application/indexserver/files/server.ini.jinja
    - mode: 644
    - user: root
    - group: root
    - template: jinja
    - defaults:
      queue_seq: {{ queue_seq }}
{% endfor %}
