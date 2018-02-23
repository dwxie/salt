MachineID: 3100651794
apache:
  kafka:
    config:
      server:
        broker:
          id: 5
        advertised:
          listeners: 'PLAINTEXT://5.kafka.private:9092'
        listeners: 'PLAINTEXT://5.kafka.private:9092'
        log: {dirs: /data1/kafka}
  zookeeper:
    config:
      zoo:
        myid: 1
        dataDir: /data1/zookeeper
cos:
  WebServer:
    config:
      diskServer:
        node: 1
        storagepaths:
        - {storageroot: /data1/webserver, storageserver: 127.0.0.1}
        - {storageroot: /data2/webserver, storageserver: '192.168.2.217:8192'}
        - {storageroot: /data3/webserver, storageserver: '192.168.2.218:8192'}
  codispatcher:
    config:
      general: {rpcServer: 192.168.2.217}
  filedelete:
    config:
      general: {DelPath: /data1}
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
