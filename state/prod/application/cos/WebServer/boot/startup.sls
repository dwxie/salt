{% set name = "WebServer" %}
{% set source_prefix = "salt://application/cos/WebServer/files" %}

boot startup {{ name }} server:
  cmd.script:
    - source: {{ source_prefix }}/boot_startup.sh
    - cwd: /tmp
