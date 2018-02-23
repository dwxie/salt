{% set name = "codproducer" %}
{% set source_prefix = "salt://application/cos/codproducer/files" %}

boot startup {{ name }} server:
  cmd.script:
    - source: {{ source_prefix }}/boot_startup.sh
    - cwd: /tmp
