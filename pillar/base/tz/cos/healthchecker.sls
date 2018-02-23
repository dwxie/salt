cos:
  HealthChecker:
    config:
      log:
        level: 'INFO'
        path: './logs'
        filename: 'healthchecker.2006.01.02.log'
      transLog:
        level: 'WARN'
        path: './logs'
        filename: 'healthchecker.trans.2006.01.02.log'
        format: 'json'
      mongo:
        mongo_url: 'adfs:A26JQ34PTFWqxZ9PqV5EFB0iu@5.tz.mongodb.dynamic:27417,6.tz.mongodb.dynamic:27417,7.tz.mongodb.dynamic:27417/?authSource=adfs&replicaSet=co_adfs'
        track_url: 'topvdn:qjPLZ5H4y7MDFSW6vfxoU2gha@5.tz.mongodb.dynamic:27517,6.tz.mongodb.dynamic:27517,7.tz.mongodb.dynamic:27517/?authSource=topvdn&replicaSet=co_disktracker'
      cleanStrategy:
        cleanType: 2
        expire: 2592000
        sleep: 10
        LockTime: 10800
        uploadLogPath: './logs'
        cleanPath:
          - '/data1'
          - '/data2'
          - '/data3'
        cleanWarnSpace: 0.2
        spaceQueryTime: 60
        cleanLoopTime: 300
        stastic_edge: 100
        space_stat_time: '00:00:00'
      transLogHandler:
        logPath:
          - './logs'
