{% set source_prefix = "salt://users/files/sudoer/ops" %}
{% set user = 'sysadmin' %}
{% set group = 'sysadmin' %}

grant privilege for {{ user }}:
  file.managed:
    - name: /etc/sudoers.d/{{ user }}
    - source: {{ source_prefix }}/{{ user }}
    - mode: 440
    - user: root
    - group: root
