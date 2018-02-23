MachineID: 756363758
cos:
  WebServer:
    config:
      diskServer:
        node: 2
        storagepaths:
        - {storageroot: /data1/webserver, storageserver: '192.168.2.52:8192'}
        - {storageroot: /data2/webserver, storageserver: 127.0.0.1}
        - {storageroot: /data3/webserver, storageserver: '192.168.2.54:8192'}
  codispatcher:
    config:
      general: {rpcServer: 192.168.2.53}
  filedelete:
    config:
      general: {DelPath: /data2}
kafka:
  config:
    broker: {ID: '53', advertised_host_name: 192.168.2.53, advertised_port: '9092',
      myid: '2'}
    log: {dirs: /data2/kafka_data}
mongodb:
  replications:
    co_adfs:
      instances:
      - net: {port: 27417}
        role: secondary
      security: {authorization: enabled, keyFile: /etc/mongodb/mo_co_storage_key,
        salt_source_file: application/mongodb/files/mo_co_storage_key}
    co_disktracker:
      instances:
      - net: {port: 27517}
        role: secondary
      security: {authorization: enabled, keyFile: /etc/mongodb/mo_co_storage_key,
        salt_source_file: application/mongodb/files/mo_co_storage_key}
  storage: {dbPath_prefix: /data2/mongodb}
zookeeper:
  config: {datadir: /data2/zookeeper}
