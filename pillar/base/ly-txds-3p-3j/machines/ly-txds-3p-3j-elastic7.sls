disk:
- {device: sdb, device_uuid: f4287fed-2e55-4d6a-92eb-9adc05ad9163, mount_dir: /disk/1,
  options: 'defaults,noatime', type: xfs}
elastic:
  elasticsearch:
    ES_HEAP_NEWSIZE: ''
    ES_HEAP_SIZE: 31g
    elasticsearch:
      network: {host: 192.168.2.226}
      node:
        attr: {tag: hot}
        data: 'true'
        master: 'false'
        name: node7
      path:
        data: [/disk/1]
