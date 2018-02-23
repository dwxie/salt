{% set name = "recordindex" %}
{% set source_prefix = "salt://application/cos/recordindex/files" %}

boot startup {{ name }} server:
  cmd.script:
    - source: {{ source_prefix }}/boot_startup.sh
    - cwd: /tmp
