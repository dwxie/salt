{% set name = "CONginx" %}
{% set source_prefix = "salt://application/cos/CONginx/files" %}

boot startup {{ name }} server:
  cmd.script:
    - source: {{ source_prefix }}/boot_startup.sh
    - cwd: /tmp
