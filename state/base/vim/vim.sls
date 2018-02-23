push vim.20150808.tar.gz file:
  file.managed:
    - name: /tmp/vim.20150808.tar.gz
    - source: http://183.57.151.178/packets/vim.20150808.tar.gz
    - source_hash: md5=63090598d14132c126ac2e6048f33ee1
    - mode: 644
    - user: root
    - group: root

unpack vim.20150808.tar.gz file:
  cmd.run:
    - name: tar xf vim.20150808.tar.gz
    - cwd: /tmp
    - onlyif:
      - test -f /tmp/vim.20150808.tar.gz

sync vim plugin:
  cmd.run:
    - name: rsync -av /tmp/.vim/ /root/.vim/
    - cwd: /tmp
    - onlyif:
      - test -d /tmp/.vim

delete vim.20150808.tar.gz file:
  file.absent:
    - name: /tmp/vim.20150808.tar.gz
    - onlyif:
      - test -f /tmp/vim.20150808.tar.gz

delete .vim folder:
  file.absent:
    - name: /tmp/.vim
    - onlyif:
      - test -d /tmp/.vim
