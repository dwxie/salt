{% set prefix = "/opt" %}
{% set name = "MachineID" %}

run {{ prefix }}/{{ name }} script:
  cmd.run:
    - name: {{ prefix }}/{{ name }}
    - cwd: {{ prefix }}
    - onlyif:
      - test -f {{ prefix }}/{{ name }}
