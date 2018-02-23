elastic:
  elasticsearch:
    ES_HEAP_NEWSIZE: ''
    ES_HEAP_SIZE: 4g
    elasticsearch:
      network: {host: 192.168.2.26}
      node:
        attr: {tag: hot}
        data: 'false'
        master: 'false'
        name: calc1
      path:
        data: [/disk/1, /disk/2]
