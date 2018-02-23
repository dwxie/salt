# push rm indexserver log script state

push unbond.py script:
  file.managed:
    - name: /opt/sa_tools/scripts/py/unbond.py
    - source: salt://tmp/unbond.py
    - mode: 755
    - user: root
    - group: root
