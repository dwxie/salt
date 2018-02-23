{% set name = "codisktracker" %}
{% set source_prefix = "salt://application/cos/codisktracker/files" %}

boot startup {{ name }} server:
  cmd.script:
    - source: {{ source_prefix }}/boot_startup.sh
    - cwd: /tmp
