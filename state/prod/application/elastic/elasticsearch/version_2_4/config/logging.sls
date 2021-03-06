{% set prefix = "/opt/elasticsearch/config" %}
{% set name = "logging.yml" %}
{% set source_prefix = "salt://application/elastic/elasticsearch/version_2_4/files" %}
{% set user = "elasticsearch" %}
{% set group = "elasticsearch" %}

push {{ prefix }}/{{ name }} file:
  file.managed:
    - name: {{ prefix }}/{{ name }}
    - source: {{ source_prefix }}/{{ name }}.jinja
    - mode: 644
    - user: {{ user }}
    - group: {{ group }}
    - onlyif:
      - test -d {{ prefix }}
