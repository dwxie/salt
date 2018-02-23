{% set prefix = "/opt/nginx/conf" %}
{% set sites_available = prefix + "/sites-available" %}
{% set sites_enabled = prefix + "/sites-enabled" %}
{% set source_prefix = "salt://project/shty/cs/shty/camera/nginx/files" %}
{% set user = 'root' %}
{% set group = 'root' %}

{% set vhosts = salt['pillar.get']('cs:center:camera:nginx:vhosts') -%}
{% for vhost in vhosts %}

push {{ sites_available }}/{{ vhost }} file:
  file.managed:
    - name: {{ sites_available }}/{{ vhost }}
    - source: {{ source_prefix }}/{{ vhost }}.jinja
    - mode: 644
    - user: {{ user }}
    - group: {{ group }}
    - template: jinja
    - defaults:
      vhost: {{ vhost }}

create a symbolic link from from {{ sites_available }}/{{ vhost }} to {{ sites_enabled }}/{{ vhost }}:
  file.symlink:
    - name: {{ sites_enabled }}/{{ vhost }}
    - target: ../sites-available/{{ vhost }}
    - user: {{ user }}
    - group: {{ group }}

{% endfor %}
