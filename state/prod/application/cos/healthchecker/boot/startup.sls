{% set name = "healthchecker" %}
{% set source_prefix = "salt://application/cos/healthchecker/files" %}

boot startup {{ name }} server:
  cmd.script:
    - source: {{ source_prefix }}/boot_startup.sh
    - cwd: /tmp
