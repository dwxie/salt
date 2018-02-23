push .vimrc file:
  file.managed:
    - name: /root/.vimrc
    - source: salt://vim/files/.vimrc
    - mode: 644
    - user: root
    - group: root
