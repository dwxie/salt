zabbix:
  agentd:
    PidFile: '/usr/local/services/zabbix/logs/zabbix_agentd.pid'
    LogFile: '/usr/local/services/zabbix/logs/zabbix_agentd.log'
    LogFileSize: 128
    DebugLevel: 3
    EnableRemoteCommands: 0
    Server: 'zbx.topvdn.com'
    ListenPort: 10050
    StartAgents: 3
    AllowRoot: 0
    User: 'topvdn'
    ServerActive: 'zbx.topvdn.com'
    HostnameItem: 'system.hostname'
    Include: '/usr/local/services/zabbix/etc/zabbix_agentd.conf.d/'
