absent chinacache sudo file:
  file.absent:
    - name: /etc/sudoers.d/chinacache
    - onlyif:
      - test -f /etc/sudoers.d/chinacache

absent chinacache sudo from /etc/sudoers:
  cmd.run:
    - name: sed -i '/chinacache/d' /etc/sudoers

absent luchaoshu sudo from /etc/sudoers:
  cmd.run:
    - name: sed -i '/luchaoshu/d' /etc/sudoers

absent libingkun sudo from /etc/sudoers:
  cmd.run:
    - name: sed -i '/libingkun/d' /etc/sudoers

absent yugan sudo from /etc/sudoers:
  cmd.run:
    - name: sed -i '/yugan/d' /etc/sudoers

absent liyulong sudo from /etc/sudoers:
  cmd.run:
    - name: sed -i '/liyulong/d' /etc/sudoers

absent operator1 sudo from /etc/sudoers:
  cmd.run:
    - name: sed -i '/operator1/d' /etc/sudoers

