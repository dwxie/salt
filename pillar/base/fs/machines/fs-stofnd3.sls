MachineID: 3100651794
apache:
  kafka:
    config:
      server:
        broker:
          id: 7
        advertised:
          listeners: 'PLAINTEXT://7.kafka.private:9092'
        listeners: 'PLAINTEXT://7.kafka.private:9092'
        log: {dirs: /data3/kafka}
  zookeeper:
    config:
      zoo:
        myid: 3
        dataDir: /data3/zookeeper
cos:
  WebServer:
    config:
      diskServer:
        node: 3
        storagepaths:
        - {storageroot: /data1/webserver, storageserver: '192.168.2.216:8192'}
        - {storageroot: /data2/webserver, storageserver: '192.168.2.217:8192'}
        - {storageroot: /data3/webserver, storageserver: 127.0.0.1}
  codispatcher:
    config:
      general: {rpcServer: 192.168.2.217}
  filedelete:
    config:
      general: {DelPath: /data3}
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
