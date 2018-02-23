cos:
  LoopDispatcher:
    config:
      log:
        level: 'INFO'
        path: './logs'
        filename: 'diskmanager.2006.01.02.log'
      transLog:
        level: 'WARN'
        path: './logs'
        filename: 'diskmanager.trans.2006.01.02.log'
        format: 'json'
      mongo:
        mongo_url: 'adfs:A26JQ34PTFWqxZ9PqV5EFB0iu@5.tz.mongodb.dynamic:27417,6.tz.mongodb.dynamic:27417,7.tz.mongodb.dynamic:27417/?authSource=adfs&replicaSet=co_adfs'
        track_url: 'topvdn:qjPLZ5H4y7MDFSW6vfxoU2gha@5.tz.mongodb.dynamic:27517,6.tz.mongodb.dynamic:27517,7.tz.mongodb.dynamic:27517/?authSource=topvdn&replicaSet=co_disktracker'
      loopStrategy:
        MountCommand: df -TH | grep nfs4 | awk '{print $2, $7}'
        diskTrack_IP: '192.168.2.251'
        diskTrack_Port: 5730
        peerID: 1
        cycle: 1
        M: 8
        N: 4
        MinSize: 102400
        MaxSize: 1073741824
        MaxErrorCount: 2
        stastic_edge: 100
