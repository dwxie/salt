{% set name = "codispatcher" %}
{% set source_prefix = "salt://application/cos/codispatcher/files" %}

boot startup {{ name }} server:
  cmd.script:
    - source: {{ source_prefix }}/boot_startup.sh
    - cwd: /tmp
