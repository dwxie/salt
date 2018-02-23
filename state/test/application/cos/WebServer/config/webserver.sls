{% set prefix = "/opt/WebServer" %}
{% set name = "webserverMain.conf.yaml" %}
{% set source_prefix = "salt://application/cos/WebServer/files" %}
{% set user = 'root' %}
{% set group = 'root' %}

push {{ prefix }}/{{ name }} file:
  file.managed:
    - name: {{ prefix }}/{{ name }}
    - source: {{ source_prefix }}/{{ name }}.jinja
    - mode: 644
    - user: {{ user }}
    - group: {{ group }}
    - template: jinja
