{%set prefix = '/tmp' %}
{%set name = 'nginx.conf' %}

push {{ name }} file for index_web:
  file.managed:
    - name: {{ prefix }}/{{ name }}
    - source: salt://application/index_web/files/{{ name }}.jinja
    - mode: 644
    - user: root
    - group: root
    - template: jinja
