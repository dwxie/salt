disk:
- {device: sda, device_uuid: f4287fed-2e55-4d6a-92eb-9adc05ad9163, mount_dir: /disk/1,
  options: 'defaults,noatime', type: xfs}
elastic:
  cerebro:
    config:
      supervisor:
        cerebro:
          http: {address: 42.51.17.66, port: 9001}
  elasticsearch:
    ES_HEAP_NEWSIZE: ''
    ES_HEAP_SIZE: 8g
    elasticsearch:
      network: {host: 192.168.2.227}
      node:
        attr: {tag: hot}
        data: 'true'
        master: 'true'
        name: node1
      path:
        data: [/disk/1]
  kibana:
    config:
      elasticsearch: {url: 'http://192.168.2.227:9200'}
      server: {host: 192.168.2.227, port: 5601}
