{% set name = "tracker" %}
{% set source_prefix = "salt://application/cs/tracker/files" %}

boot startup {{ name }} server:
  cmd.script:
    - source: {{ source_prefix }}/boot_startup.sh
    - cwd: /tmp
