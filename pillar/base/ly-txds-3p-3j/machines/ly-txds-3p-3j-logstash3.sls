elastic:
  elasticsearch:
    ES_HEAP_NEWSIZE: ''
    ES_HEAP_SIZE: 8g
    elasticsearch:
      network: {host: 192.168.2.218}
      node:
        attr: {tag: nodata}
        data: 'false'
        master: 'true'
        name: master3
      path:
        data: [/disk/elasticsearch]
  kibana:
    config:
      elasticsearch: {url: 'http://192.168.2.218:9200'}
      kibana: {index: .kibana}
      server: {host: 192.168.2.218, port: 5601}
  logstash:
    config:
      udplog_ly:
        input:
          rabbitmq: {host: 192.168.2.219}
