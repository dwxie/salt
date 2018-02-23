{%set prefix = '/usr/local/services/zabbix/etc/zabbix_agentd.conf.d' %}
{%set name = 'topvdn.relay.nginx.core.conf' %}

pusm {{ prefix }}/{{ name }} file for monitor:
  file.managed:
    - name: {{ prefix }}/{{ name }}
    - source: salt://application/relay/files/zabbix_agentd.conf.d/{{ name }}
    - mode: 644
    - user: topvdn
    - group: topvdn
