{% set prefix = "/opt/nginx/conf" %}
{% set sites_available = prefix + "/sites-available" %}
{% set sites_enabled = prefix + "/sites-enabled" %}
{% set source_prefix = "salt://project/antelope/cs/bj/platweb/nginx/files" %}

{% set vhosts = salt['pillar.get']('cs:center:camera:nginx:vhosts') -%}
{% for vhost in vhosts %}

push {{ sites_available }}/{{ vhost }} file:
  file.managed:
    - name: {{ sites_available }}/{{ vhost }}
    - source: {{ source_prefix }}/{{ vhost }}.jinja
    - mode: 644
    - user: root
    - group: root
    - template: jinja
    - defaults:
      vhost: {{ vhost }}

create a symbolic link from from {{ sites_available }}/{{ vhost }} to {{ sites_enabled }}/{{ vhost }}:
  file.symlink:
    - name: {{ sites_enabled }}/{{ vhost }}
    - target: ../sites-available/{{ vhost }}
    - user: root
    - group: root

{% endfor %}

