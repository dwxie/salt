# push rm indexserver log script state

push zy_tools.py lib:
  file.managed:
    - name: /opt/sa_tools/scripts/py/zy_tools.py
    - source: salt://tmp/zy_tools.py
    - mode: 755
    - user: root
    - group: root

generate .pth file for zy_tools:
  cmd.run:
    - name: echo /opt/sa_tools/scripts/py/zy_tools.py > /usr/lib/python2.7/dist-packages/zy_tools.pth
    - cwd: /opt
