elastic:
  cerebro:
    config:
      supervisor:
        cerebro:
          http: {address: 42.51.12.132, port: 9001}
  elasticsearch:
    ES_HEAP_NEWSIZE: ''
    ES_HEAP_SIZE: 8g
    elasticsearch:
      network: {host: 192.168.2.210}
      node:
        attr: {tag: nodata}
        data: 'false'
        master: 'true'
        name: master1
      path:
        data: [/disk/elasticsearch]
  kibana:
    config:
      elasticsearch: {url: 'http://192.168.2.210:9200'}
      server: {host: 192.168.2.210, port: 5601}
  logstash:
    config:
      udplog_ly:
        input:
          rabbitmq: {host: 192.168.2.211}
