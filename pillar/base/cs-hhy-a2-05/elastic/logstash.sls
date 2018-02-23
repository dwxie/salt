elastic:
  logstash:
    version: '2.4.0'
    LS_HEAP_SIZE: '4g'
    config:
      ly_log:
        input:
          beats:
            enable: true
            port: 5044
        output:
          stdout:
            enable: false
          elasticsearch:
            enable: true
            hosts:
              - '192.168.2.27:9200'
              - '192.168.2.30:9200'
            index: 'ly-log-%{+YYYY.MM.dd}'
            codec: 'json'
            document_type: '%{type}'
            flush_size: 2000
            template_overwrite: 'true'
            manage_template: 'true'
            workers: 50
