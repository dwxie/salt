{% set name = "password.sh" %}
{% set source_prefix = "salt://base/files" %}

install libpam-cracklib package:
  pkg.installed:
    - pkgs:
      - libpam-cracklib

set the password complexity:
  cmd.script:
    - source: {{ source_prefix }}/pam/{{ name }}
    - cwd: /tmp
