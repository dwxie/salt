{% set ntp_m_ip = '0.cn.pool.ntp.org' %}
{% set ntp_s_ip = '1.cn.pool.ntp.org' %}

create /backup/shell forlder:
  file.directory:
    - name: /backup/shell
    - makedirs: True
    - dir_mode: 755

create /backup/logs forlder:
  file.directory:
    - name: /backup/logs
    - makedirs: True
    - dir_mode: 777

push ntp.sh file:
  file.managed:
    - name: /backup/shell/ntpdate.sh
    - source: salt://ntp/files/ntpdate.sh
    - mode: 755
    - user: root
    - group: root
    - template: jinja
    - defaults:
      ntp_m_ip: {{ ntp_m_ip }}
      ntp_s_ip: {{ ntp_s_ip }}

remove old ntp.sh crontab:
  cmd.script:
    - source: salt://ntp/files/absent_old_crontab.sh
    - cwd: /tmp

add ntpdate crontab:
  cmd.script:
    - source: salt://ntp/files/add_crontab.sh
    - cwd: /tmp

run check zabbix conf script:
  cmd.script:
    - source: salt://ntp/files/check_if_need_add_ntpdate_result.sh
    - cwd: /tmp
