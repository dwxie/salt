change relay_yaml file:
  file.managed:
    - name: /opt/tracker/relay.yaml
    - source: salt://files/relay.yaml
    - mode: 644
    - user: root
    - group: root
