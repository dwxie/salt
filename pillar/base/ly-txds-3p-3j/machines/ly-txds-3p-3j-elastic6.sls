disk:
- {device: sdb, device_uuid: f2912730-b5a1-4619-afe3-58981947cb56, mount_dir: /disk/1,
  options: 'defaults,noatime', type: xfs}
elastic:
  elasticsearch:
    ES_HEAP_NEWSIZE: ''
    ES_HEAP_SIZE: 31g
    elasticsearch:
      network: {host: 192.168.2.225}
      node:
        attr: {tag: hot}
        data: 'true'
        master: 'false'
        name: node6
      path:
        data: [/disk/1]
