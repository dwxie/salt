elastic:
  elasticsearch:
    ES_HEAP_NEWSIZE: ''
    ES_HEAP_SIZE: 4g
    elasticsearch:
      network: {host: 192.168.2.28}
      node:
        attr: {tag: stale}
        data: 'true'
        master: 'false'
        name: stale1
      path:
        data: [/disk/1, /disk/2]
