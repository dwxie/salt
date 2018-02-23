{% set prefix = "/opt/nginx/conf" %}
{% set name = "camera-utils.conf" %}
{% set sites_available = prefix + "/sites-available" %}
{% set sites_enabled = prefix + "/sites-enabled" %}
{% set source_prefix = "salt://project/antelope/cs/bj/appweb/nginx-gridfs/files" %}

push {{ sites_available }}/{{ name }} file:
  file.managed:
    - name: {{ sites_available }}/{{ name }}
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
