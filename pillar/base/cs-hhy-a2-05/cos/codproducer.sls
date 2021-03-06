cos:
  codproducer:
    config:
      generl:
        rpcPort: :8130
        tracker_host: 'http://codisktracker.private:8201'
        tracker_token: '1003775_3145728_1577429797_abf24269c1b163a04a4090643a82f411'
      log:
        level: 'INFO'
        path: './logs'
        filename: 'codproducer.2006.01.02.log'
      recoveryLog:
        level: 'INFO'
        path: './recoveryLogs'
        filename: 'codproducer.recovery.2006.01.02.log'
        format: 'json'
      mongo:
        mongo_url: 'adfs:A26JQ34PTFWqxZ9PqV5EFB0iu@5.mongodb.private:27417,6.mongodb.private:27417,7.mongodb.private:27417/?authSource=adfs&replicaSet=co_adfs'
      dataStrategy:
        runMode: 1
        cycle: 1
        MinSize: 1024
        MaxSize: 1073741824
        produce_wait: 8
