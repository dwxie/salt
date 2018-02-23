push .gitconfig file:
  file.managed:
    - name: /root/.gitconfig
    - source: salt://git/files/.gitconfig
    - mode: 644
    - user: root
    - group: root
