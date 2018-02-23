{% set name = "COStorage" %}
{% set source_prefix = "salt://application/cos/COStorage/files" %}

boot startup {{ name }} server:
  cmd.script:
    - source: {{ source_prefix }}/boot_startup.sh
    - cwd: /tmp
