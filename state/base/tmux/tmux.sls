push .tmux.conf file:
  file.managed:
    - name: /root/.tmux.conf
    - source: salt://tmux/files/.tmux.conf
    - mode: 644
    - user: root
    - group: root
