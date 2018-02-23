mongodb:
  net:
    port: 27017
  storage:
    journal:
      enabled: 'true'
    dbPath_prefix: '/data/mongodb'
    directoryPerDB: 'true'
    engine: 'wiredTiger'
    wiredTiger:
      engineConfig:
        directoryForIndexes: 'true'
      collectionConfig:
          blockCompressor: 'zlib'
      indexConfig:
          prefixCompression: 'true'
  systemLog:
      path_prefix: '/var/log/mongodb'
      logAppend: 'true'
      destination: 'file'
  processManagement:
      fork: 'true'
