elastic:
  elasticsearch:
    ES_HEAP_NEWSIZE: ''
    ES_HEAP_SIZE: 8g
    elasticsearch:
      network: {host: 192.168.2.214}
      node:
        attr: {tag: nodata}
        data: 'false'
        master: 'true'
        name: master2
      path:
        data: [/disk/elasticsearch]
  kibana:
    config:
      elasticsearch: {url: 'http://192.168.2.214:9200'}
      server: {host: 192.168.2.214, port: 5601}
  logstash:
    config:
      udplog_ly:
        input:
          rabbitmq: {host: 192.168.2.215}
