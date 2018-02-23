{% set source_prefix = "salt://project/cyqz/nginx/files" %}
{% set name = "boot_startup.sh" %}

run {{ source_prefix }}/{{ name }} script:
  cmd.script:
    - source: {{ source_prefix }}/{{ name }}
    - cwd: /tmp
