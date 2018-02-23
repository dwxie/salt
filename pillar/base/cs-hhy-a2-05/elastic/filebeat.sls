elastic:
  filebeat:
    filebeat:
      spool_size: 1024
      idle_timeout: '5s'
    output:
      logstash:
        hosts:
          - "103.38.42.95:5044"
        loadbalance: true
        worker: 20
