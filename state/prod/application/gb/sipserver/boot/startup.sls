{% set name = "sipserver" %}
{% set source_prefix = "salt://application/gb/sipserver/files" %}

boot startup {{ name }} server:
  cmd.script:
    - source: {{ source_prefix }}/boot_startup.sh
    - cwd: /tmp
