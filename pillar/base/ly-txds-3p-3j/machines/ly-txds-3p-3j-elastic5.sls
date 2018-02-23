disk:
- {device: sdb, device_uuid: a6391402-d7c3-431b-b512-b102c6af7cae, mount_dir: /disk/1,
  options: 'defaults,noatime', type: xfs}
- {device: sdc, device_uuid: ab6a9ea9-0ab7-4c7f-a28c-8df675329902, mount_dir: /disk/2,
  options: 'defaults,noatime', type: xfs}
elastic:
  elasticsearch:
    ES_HEAP_NEWSIZE: ''
    ES_HEAP_SIZE: 31g
    elasticsearch:
      network: {host: 192.168.2.216}
      node:
        attr: {tag: hot}
        data: 'true'
        master: 'false'
        name: node5
      path:
        data: [/disk/1, /disk/2]
