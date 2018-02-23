elastic:
  cerebro:
    config:
      application:
        hosts:
        - {host: 'http://192.168.2.27:9200', name: cs-hhy-a2-05-free1}
      supervisor:
        cerebro:
          http: {address: 103.38.42.93, port: 9001}
  elasticsearch:
    ES_HEAP_NEWSIZE: ''
    ES_HEAP_SIZE: 4g
    elasticsearch:
      network: {host: 192.168.2.27}
      node:
        attr: {tag: hot}
        data: 'true'
        master: 'true'
        name: hot1
      path:
        data: [/disk/1, /disk/2]
  kibana:
    config:
      elasticsearch: {url: 'http://192.168.2.27:9200'}
      server: {basePath: ''}
