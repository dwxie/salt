{%set prefix = '/opt/nginx-tool/sbin' %}
{%set script_prefix = '/opt/nginx-tool/sbin' %}

absent {{ prefix }}/CenterServerConfig.conf file:
  file.absent:
    - name: {{ prefix }}/CenterServerConfig.conf
    - onlyif:
      - test -f {{ prefix }}/CenterServerConfig.conf

absent {{ prefix }}/ConnectionConfig.conf file:
  file.absent:
    - name: {{ prefix }}/ConnectionConfig.conf
    - onlyif:
      - test -f {{ prefix }}/ConnectionConfig.conf

absent {{ prefix }}/disk_schedule.conf file:
  file.absent:
    - name: {{ prefix }}/disk_schedule.conf
    - onlyif:
      - test -f {{ prefix }}/disk_schedule.conf

absent {{ prefix }}/DistributeConfig.conf file:
  file.absent:
    - name: {{ prefix }}/DistributeConfig.conf
    - onlyif:
      - test -f {{ prefix }}/DistributeConfig.conf

absent {{ prefix }}/JpgSrvIP.conf file:
  file.absent:
    - name: {{ prefix }}/JpgSrvIP.conf
    - onlyif:
      - test -f {{ prefix }}/JpgSrvIP.conf

absent {{ prefix }}/MQServerConfig.conf file:
  file.absent:
    - name: {{ prefix }}/MQServerConfig.conf
    - onlyif:
      - test -f {{ prefix }}/MQServerConfig.conf

absent {{ prefix }}/RelayConfig.conf file:
  file.absent:
    - name: {{ prefix }}/RelayConfig.conf
    - onlyif:
      - test -f {{ prefix }}/RelayConfig.conf

absent {{ prefix }}/TrackerServerConfig.conf file:
  file.absent:
    - name: {{ prefix }}/TrackerServerConfig.conf
    - onlyif:
      - test -f {{ prefix }}/TrackerServerConfig.conf

absent {{ prefix }}/smtp.conf file:
  file.absent:
    - name: {{ prefix }}/smtp.conf
    - onlyif:
      - test -f {{ prefix }}/smtp.conf

absent {{ prefix }}/push.conf file:
  file.absent:
    - name: {{ prefix }}/push.conf
    - onlyif:
      - test -f {{ prefix }}/push.conf

run remove_nodejs.sh script:
  cmd.script:
    - name: salt://tmp/remove_nodejs.sh
    - cwd: /tmp

absent /backup/script/node_delay.sh file:
  file.absent:
    - name: /backup/script/node_delay.sh
    - onlyif:
      - test -f /backup/script/node_delay.sh

absent /backup/script/snapshot_delay.sh file:
  file.absent:
    - name: /backup/script/snapshot_delay.sh
    - onlyif:
      - test -f /backup/script/snapshot_delay.sh

absent /backup/script/cron_rm.py file:
  file.absent:
    - name: /backup/script/cron_rm.py
    - onlyif:
      - test -f /backup/script/cron_rm.py

absent /backup/script/node_restart.py file:
  file.absent:
    - name: /backup/script/node_restart.py
    - onlyif:
      - test -f /backup/script/node_restart.py

