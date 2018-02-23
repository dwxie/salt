{% set name = "security.sh" %}
{% set source_prefix = "salt://base/files" %}

set idle interrupt time for system user:
  cmd.script:
    - source: {{ source_prefix }}/{{ name }}
    - cwd: /tmp
