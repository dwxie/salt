{% set prefix = "/usr/local/services/nginx/conf" %}
{% set sites_available = prefix + "/sites-available" %}
{% set sites_enabled = prefix + "/sites-enabled" %}
{% set name = "kibana.ops.topvdn.com.conf" %}
{% set source_prefix = "salt://city/ly-txds-3p-3j/ly-txds-3p-3j-logstash3/nginx/files" %}

create {{ sites_available }} folder:
  file.directory:
    - name: {{ sites_available }}
    - user: root
    - group: root
    - dir_mode: 755
    - makedirs: true

create {{ sites_enabled }} folder:
  file.directory:
    - name: {{ sites_enabled }}
    - user: root
    - group: root
    - dir_mode: 755
    - makedirs: true

push {{ sites_available }}/{{ name}} file:
  file.managed:
    - name: {{ sites_available }}/{{ name}}
    - source: {{ source_prefix }}/{{ name }}.jinja
    - mode: 644
    - user: root
    - group: root
    - template: jinja

create a symbolic link from from {{ sites_available }}/{{ name }} to {{ sites_enabled }}/{{ name }}:
  file.symlink:
    - name: {{ sites_enabled }}/{{ name }}
    - target: ../sites-available/{{ name }}
    - user: root
    - group: root
