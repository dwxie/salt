{% set name = "sipmediaserver" %}
{% set source_prefix = "salt://application/gb/sipmediaserver/files" %}

boot startup {{ name }} server:
  cmd.script:
    - source: {{ source_prefix }}/boot_startup.sh
    - cwd: /tmp
