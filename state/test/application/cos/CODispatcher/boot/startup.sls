{% set name = "LoopDispatcher" %}
{% set source_prefix = "salt://application/cos/LoopDispatcher/files" %}

boot startup {{ name }} server:
  cmd.script:
    - source: {{ source_prefix }}/boot_startup.sh
    - cwd: /tmp
