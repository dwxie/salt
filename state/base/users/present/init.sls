include:
  - users.present.common
  - users.present.ops

cancel env reset when sudo:
  file.managed:
    - name: /etc/sudoers.d/not_env_reset
    - source: salt://users/files/sudoer/not_env_reset
    - mode: 440
    - user: root
    - group: root
