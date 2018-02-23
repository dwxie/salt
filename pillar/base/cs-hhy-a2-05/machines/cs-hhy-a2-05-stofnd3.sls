MachineID: 3100651794
cos:
  WebServer:
    config:
      diskServer:
        node: 3
        storagepaths:
        - {storageroot: /data1/webserver, storageserver: '192.168.2.31:8192'}
        - {storageroot: /data2/webserver, storageserver: '192.168.2.32:8192'}
        - {storageroot: /data3/webserver, storageserver: 127.0.0.1}
  codispatcher:
    config:
      general: {rpcServer: 192.168.2.32}
  filedelete:
    config:
      general: {DelPath: /data3}
kafka:
  config:
    broker: {ID: '33', advertised_host_name: 192.168.2.33, advertised_port: '9092',
      myid: '3'}
    log: {dirs: /data3/kafka_data}
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
zookeeper:
  config: {datadir: /data3/zookeeper}
