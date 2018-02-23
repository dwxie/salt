elastic:
  filebeat:
    filebeat:
      spool_size: 1024
      idle_timeout: '5s'
    output:
      logstash:
        hosts:
          - "42.51.12.132:5044"
          - "42.51.12.136:5044"
          - "42.51.12.140:5044"
        loadbalance: true
        worker: 20
