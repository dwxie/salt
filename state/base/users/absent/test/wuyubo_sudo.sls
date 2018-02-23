absent wuyubo sudo file:
  file.absent:
    - name: /etc/sudoers.d/wuyubo
    - onlyif:
      - test -f /etc/sudoers.d/wuyubo
