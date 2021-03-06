cos:
  healthchecker:
    config:
      generl:
        rpc_port: :8101
        rpc_codproducer:
          - 192.168.2.53:8130
        tracker_host: 'http://codisktracker.private:8201'
        tracker_token: '1003775_3145728_1577429797_abf24269c1b163a04a4090643a82f411'
      log:
        level: 'INFO'
        path: './logs'
        filename: 'healthchecker.2006.01.02.log'
      recoveryLog:
        level: 'WARN'
        path: './recoveryLogs'
        filename: 'healthchecker.recovery.2006.01.02.log'
        format: 'json'
      statLog:
        level: 'INFO'
        path: './statLogs'
        filename: 'healthchecker.stat.2006.01.02.log'
        format: 'json'
      mongo:
        mongo_url: 'adfs:Tua3JkV1CselXlN1o24BPfk5b@4.psrnc.mongodb.dynamic:27417,5.psrnc.mongodb.dynamic:27417,6.psrnc.mongodb.dynamic:27417/?authSource=adfs&replicaSet=co_adfs'
        track_url: 'topvdn:HQ51Y133956MU0e0710xsNy4K@4.psrnc.mongodb.dynamic:27517,5.psrnc.mongodb.dynamic:27517,6.psrnc.mongodb.dynamic:27517/?authSource=topvdn&replicaSet=co_disktracker'
      cleanStrategy:
        expire: 2592000
        sleep: 10
        LockTime: 10800
        uploadLogPath: './logs'
        cleanPath:
          - '/data1'
          - '/data2'
          - '/data3'
        cleanWarnSpace: 0.3
        spaceQueryTime: 60
        DelThreadNum: 10
        CleanSize: 102400
        privateFlag: true
        storageDays: 3
