MachineID: 3100651794
apache:
  kafka:
    config:
      server:
        broker:
          id: 6
        advertised:
          listeners: 'PLAINTEXT://6.kafka.private:9092'
        listeners: 'PLAINTEXT://6.kafka.private:9092'
        log: {dirs: /data2/kafka}
  zookeeper:
    config:
      zoo:
        myid: 2
        dataDir: /data2/zookeeper
cos:
  WebServer:
    config:
      diskServer:
        node: 2
        storagepaths:
        - {storageroot: /data1/webserver, storageserver: '192.168.2.216:8192'}
        - {storageroot: /data2/webserver, storageserver: 127.0.0.1}
        - {storageroot: /data3/webserver, storageserver: '192.168.2.218:8192'}
  codispatcher:
    config:
      general: {rpcServer: codproducer.private}
  filedelete:
    config:
      general: {DelPath: /data2}
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
