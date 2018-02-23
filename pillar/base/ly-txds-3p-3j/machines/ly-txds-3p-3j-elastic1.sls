disk:
- {device: sdb, device_uuid: eb696642-e8a0-40f4-92ae-dd61fcb06581, mount_dir: /disk/1,
  options: 'defaults,noatime', type: xfs}
- {device: sdc, device_uuid: 8e79b27f-030b-4a34-bd0b-eda5290787f5, mount_dir: /disk/2,
  options: 'defaults,noatime', type: xfs}
elastic:
  elasticsearch:
    ES_HEAP_NEWSIZE: ''
    ES_HEAP_SIZE: 31g
    elasticsearch:
      network: {host: 192.168.2.208}
      node:
        attr: {tag: hot}
        data: 'true'
        master: 'false'
        name: node1
      path:
        data: [/disk/1, /disk/2]
