absent mengxiangyi sudo file:
  file.absent:
    - name: /etc/sudoers.d/mengxiangyi
    - onlyif:
      - test -f /etc/sudoers.d/mengxiangyi