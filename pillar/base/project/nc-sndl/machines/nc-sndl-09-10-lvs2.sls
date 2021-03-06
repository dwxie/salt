elastic:
  filebeat:
    config:
      filebeat:
        prospectors:
        - fields: {type: index_web_nginx}
          fields_under_root: true
          paths: [/var/log/nginx/access.log]
        - fields: {type: index_web_log}
          fields_under_root: true
          paths: [/data/log/supervisor/index_web/application.log]
index_web:
  config: {INDEX_WEB_BROKER_URL: 'redis://:BzpUCHeuJjr4qZFDQ9zR2JkLyXeAejQCpVArDNHQfxPTkhuh@127.0.0.1:6800/3',
    INDEX_WEB_CEPH_CONFIG: '', INDEX_WEB_CEPH_TS_POOL: event_storage, INDEX_WEB_IP: 103.38.42.83,
    INDEX_WEB_REDIS_DB: '2', INDEX_WEB_REDIS_HOST: 127.0.0.1, INDEX_WEB_REDIS_PASSWD: BzpUCHeuJjr4qZFDQ9zR2JkLyXeAejQCpVArDNHQfxPTkhuh,
    INDEX_WEB_REDIS_PORT: '6800'}
