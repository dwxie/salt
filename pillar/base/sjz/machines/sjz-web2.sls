cs:
  zone:
    nginx:
      vhosts:
        zone.topvdn.com.conf:
          server_names: [61.55.189.134, zone4.topvdn.com]
elastic:
  filebeat:
    config:
      filebeat:
        prospectors:
        - fields:
          - {type: index_web_nginx}
          fields_under_root: true
          paths: [/opt/nginx/logs/zone.topvdn.com.access.log]
        - fields:
          - {type: index_web_log}
          fields_under_root: true
          paths: [/data/log/supervisor/index_web/application.log]
        - fields:
          - {type: disktracker}
          fields_under_root: true
          paths: [/opt/disktracker/log/*.tracker.log]
index_web:
  config: {INDEX_WEB_BROKER_URL: 'redis://:BzpUCHeuJjr4qZFDQ9zR2JkLyXeAejQCpVArDNHQfxPTkhuh@127.0.0.1:6800/3',
    INDEX_WEB_CEPH_CONFIG: '', INDEX_WEB_CEPH_TS_POOL: event_storage,
    INDEX_WEB_IP: 61.55.189.134, INDEX_WEB_REDIS_DB: '2', INDEX_WEB_REDIS_HOST: 127.0.0.1,
    INDEX_WEB_REDIS_PASSWD: BzpUCHeuJjr4qZFDQ9zR2JkLyXeAejQCpVArDNHQfxPTkhuh, INDEX_WEB_REDIS_PORT: '6800'}
