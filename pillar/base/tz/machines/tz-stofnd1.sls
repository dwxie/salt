MachineID: 3100651794
cos:
  WebServer:
    config:
      diskServer:
        storagepaths:
        - {storageroot: /data1, storageserver: 127.0.0.1}
        - {storageroot: /data2, storageserver: '192.168.2.249:8192'}
        - {storageroot: /data3, storageserver: '192.168.2.251:8192'}
healthcheck:
  config:
    log: {filename: diskmanager.2006.01.02.15.log, level: INFO, path: ./logs}
mongodb:
  replications:
    co_adfs:
      instances:
      - net: {port: 27417}
        role: primary
      security: {authorization: enabled, keyFile: /etc/mongodb/mo_co_storage_key,
        salt_source_file: application/mongodb/files/mo_co_storage_key}
    co_disktracker:
      instances:
      - net: {port: 27517}
        role: primary
      security: {authorization: enabled, keyFile: /etc/mongodb/mo_co_storage_key,
        salt_source_file: application/mongodb/files/mo_co_storage_key}
  storage: {dbPath_prefix: /data1/mongodb}
