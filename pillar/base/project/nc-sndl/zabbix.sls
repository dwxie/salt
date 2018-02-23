zabbix:
  agentd:
    PidFile: '/usr/local/services/zabbix/logs/zabbix_agentd.pid'
    LogFile: '/usr/local/services/zabbix/logs/zabbix_agentd.log'
    LogFileSize: 128
    DebugLevel: 3
    EnableRemoteCommands: 0
    Server: '192.168.2.20'
    ListenPort: 10050
    StartAgents: 3
    AllowRoot: 0
    User: 'topvdn'
    ServerActive: '192.168.2.20'
    HostnameItem: 'system.hostname'
    Include: '/usr/local/services/zabbix/etc/zabbix_agentd.conf.d/'
