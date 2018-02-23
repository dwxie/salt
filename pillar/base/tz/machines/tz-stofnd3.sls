MachineID: 3100651794
cos:
  WebServer:
    config:
      diskServer:
        storagepaths:
        - {storageroot: /data1, storageserver: '192.168.2.248:8192'}
        - {storageroot: /data2, storageserver: '192.168.2.249:8192'}
        - {storageroot: /data3, storageserver: 127.0.0.1}
mongodb:
  replications:
    co_adfs:
      instances:
      - net: {port: 27417}
        role: third
      security: {authorization: enabled, keyFile: /etc/mongodb/mo_co_storage_key,
        salt_source_file: application/mongodb/files/mo_co_storage_key}
    co_disktracker:
      instances:
      - net: {port: 27517}
        role: third
      security: {authorization: enabled, keyFile: /etc/mongodb/mo_co_storage_key,
        salt_source_file: application/mongodb/files/mo_co_storage_key}
  storage: {dbPath_prefix: /data3/mongodb}
