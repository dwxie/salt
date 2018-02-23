{% set prefix = '/opt/indexserver/etc' %}
{% set name = "server.ini" %}
{% set source_prefix = "salt://application/cs/indexserver/files" %}
{% set user = 'root' %}
{% set group = 'root' %}

create {{ prefix }} folder:
  file.directory:
    - name: {{ prefix }}
    - user: root
    - group: root
    - dir_mode: 755
    - makedirs: true

{% for queue_seq in pillar['indexserver']['RUN_QUEUE'] %}
{% set queue_http_port = 7000 + queue_seq %}
push {{ prefix }}/server-{{ queue_seq }}.ini file:
  file.managed:
    - name: {{ prefix }}/indexserver-{{ queue_seq }}.ini
    - source: {{ source_prefix }}/{{ name }}.jinja
    - mode: 644
    - user: {{ user }}
    - group: {{ group }}
    - template: jinja
    - defaults:
      queue_http_port: {{ queue_http_port }}
      queue_seq: {{ queue_seq }}
{% endfor %}
