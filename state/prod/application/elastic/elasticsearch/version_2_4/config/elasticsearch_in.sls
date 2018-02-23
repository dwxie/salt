{% set prefix = "/opt/elasticsearch/bin" %}
{% set name = "elasticsearch.in.sh" %}
{% set source_prefix = "salt://application/elastic/elasticsearch/version_2_4/files" %}
{% set user = "elasticsearch" %}
{% set group = "elasticsearch" %}

push {{ prefix }}/{{ name }} file:
  file.managed:
    - name: {{ prefix }}/{{ name }}
    - source: {{ source_prefix }}/{{ name }}.jinja
    - mode: 755
    - user: {{ user }}
    - group: {{ group }}
    - template: jinja
    - onlyif:
      - test -d {{ prefix }}
