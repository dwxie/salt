{%set prefix = '/opt/cyqz-2.0' %}
{%set name = 'cyqz-2.0.jar' %}
{%set md5 = '37d9489dceecd57df25a01791072534b' %}

push {{ prefix }}/{{ name }} file:
  file.managed:
    - name: {{ prefix }}/{{ name }}
    - source: http://file.topvdn.com/{{ name }}
    - source_hash: md5={{ md5 }}
    - mode: 644
    - user: root
    - group: root
