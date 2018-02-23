MachineID: 756363758
cos:
  WebServer:
    config:
      diskServer:
        node: 1
        storagepaths:
        - {storageroot: /data1/webserver, storageserver: 127.0.0.1}
        - {storageroot: /data2/webserver, storageserver: '192.168.2.53:8192'}
        - {storageroot: /data3/webserver, storageserver: '192.168.2.54:8192'}
  filedelete:
    config:
      general: {DelPath: /data1}
kafka:
  config:
    broker: {ID: '52', advertised_host_name: 192.168.2.52, advertised_port: '9092',
      myid: '1'}
    log: {dirs: /data1/kafka_data}
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
zookeeper:
  config: {datadir: /data1/zookeeper}
