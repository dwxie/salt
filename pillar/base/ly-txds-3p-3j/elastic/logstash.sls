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
              - '192.168.2.210:9200'
              - '192.168.2.214:9200'
              - '192.168.2.218:9200'
            index: 'ly-log-%{+YYYY.MM.dd}'
            codec: 'json'
            document_type: '%{type}'
            flush_size: 2000
            template_overwrite: 'true'
            manage_template: 'true'
            workers: 50
      udplog_bj:
        input:
          rabbitmq:
            enable: true
            host: '223.202.103.149'
            user: 'log_server'
            password: 'k6fu6c2v3r2n5qqr'
            vhost: 'log_server'
            key: 'log_server'
            queue: 'log_server'
            prefetch_count: 1000
            threads: 2
            broker: 'bj_log_mq'
        output:
          stdout:
            enable: false
          elasticsearch:
            enable: true
            hosts:
              - '192.168.2.210:9200'
              - '192.168.2.214:9200'
              - '192.168.2.218:9200'
            index: 'udplog-%{+YYYY.MM.dd}'
            codec: 'json'
            document_type: '%{[log_type]}'
            flush_size: 2000
            idle_flush_time: 10
      udplog_hz:
        input:
          rabbitmq:
            enable: true
            host: '120.26.74.53'
            user: 'log_server'
            password: 'k6fu6c2v3r2n5qqr'
            vhost: 'log_server'
            key: 'log_server'
            queue: 'log_server'
            prefetch_count: 1000
            threads: 2
            broker: 'hz_log_mq'
        output:
          stdout:
            enable: false
          elasticsearch:
            enable: true
            hosts:
              - '192.168.2.210:9200'
              - '192.168.2.214:9200'
              - '192.168.2.218:9200'
            index: 'udplog-%{+YYYY.MM.dd}'
            codec: 'json'
            document_type: '%{[log_type]}'
            flush_size: 2000
            idle_flush_time: 10
      udplog_ly:
        input:
          rabbitmq:
            enable: true
            host: '192.168.2.211'
            user: 'log_server'
            password: 'k6fu6c2v3r2n5qqr'
            vhost: 'log_server'
            key: 'log_server'
            queue: 'log_server'
            prefetch_count: 2048
            threads: 2
            broker: 'ly_log_mq'
        output:
          stdout:
            enable: false
          elasticsearch:
            enable: true
            hosts:
              - '192.168.2.210:9200'
              - '192.168.2.214:9200'
              - '192.168.2.218:9200'
            index: 'udplog-%{+YYYY.MM.dd}'
            codec: 'json'
            document_type: '%{[log_type]}'
            flush_size: 2000
            idle_flush_time: 10
