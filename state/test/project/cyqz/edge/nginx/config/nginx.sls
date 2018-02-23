{% set prefix = "/usr/local/services/nginx/conf" %}
{% set name = "nginx.conf" %}
{% set source_prefix = "salt://project/cyqz/edge/nginx/files" %}

create {{ prefix }} folder:
  file.directory:
    - name: {{ prefix }}
    - user: root
    - group: root
    - dir_mode: 755
    - makedirs: true

push {{ prefix }}/{{ name}} file:
  file.managed:
    - name: {{ prefix }}/{{ name}}
    - source: {{ source_prefix }}/{{ name }}.jinja
    - mode: 644
    - user: root
    - group: root
    - template: jinja
