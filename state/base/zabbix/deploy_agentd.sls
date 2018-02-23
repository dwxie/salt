create services folder:
  cmd.run:
    - name: mkdir -p /usr/local/services
    - onlyif: test ! -d /usr/local/services

push zabbix agentd tar file:
  file.managed:
    - name: /usr/local/services/zabbix-agentd-3.0.3.tar.gz
    - source: http://42.51.7.46/compiled/zabbix/zabbix-agentd-3.0.3.tar.gz
    - source_hash: md5=7c1fd34090ddc8e9342c57340a5f1069
    - mode: 644
    - user: root
    - group: root
    - onlyif:
      - test ! -f zabbix-agentd-3.0.3.tar.gz

unpack zabbix agentd tar file:
  cmd.run:
    - name: tar xf zabbix-agentd-3.0.3.tar.gz
    - cwd: /usr/local/services
    - onlyif:
      - test -f zabbix-agentd-3.0.3.tar.gz
      - test ! -f zabbix-3.0.3/sbin/zabbix_agentd

create symlink:
  cmd.run:
    - name: ln -s zabbix-3.0.3 zabbix
    - cwd: /usr/local/services
    - onlyif:
      - test ! -d zabbix
      - test ! -h zabbix

create zabbix_agentd symlink:
  cmd.run:
    - name: ln -sf /usr/local/services/zabbix/sbin/zabbix_agentd zabbix_agentd
    - cwd: /usr/local/bin
    - onlyif:
      - test ! -d zabbix_agentd
      - test ! -f zabbix_agentd

del zabbix agentd tar file:
  file.absent:
    - name: /usr/local/services/zabbix-agentd-3.0.3.tar.gz

change zabbix folder permissions:
  cmd.run:
    - name: chown -R 62016.62016 /usr/local/services/zabbix-3.0.3
    - cwd: /usr/local/services
    - onlyif:
      - test -d /usr/local/services/zabbix-3.0.3

run zabbix agentd:
  cmd.run:
    - name: /usr/local/services/zabbix/sbin/zabbix_agentd -c /usr/local/services/zabbix/etc/zabbix_agentd.conf
    - cwd: /usr/local/services/zabbix/sbin
    - onlyif:
      - test -x /usr/local/services/zabbix/sbin/zabbix_agentd
