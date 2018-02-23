cos:
  WebServer:
    config:
      web:
        protocol: 'http'
        port: ':8088'
        certFile: 'idfile'
        keyFile: 'idfile.key'
        syncnum: 200
        stastic_edge: 100
        debug: false
      log:
        level: 'INFO'
        path: './logs'
        filename: 'webserverMain.2006.01.02.15.log'
        format: 'text'
      transLog:
        level: 'WARN'
        path: './logs'
        filename: 'webserverMain.trans.2006.01.02.15.log'
        format: 'json'
      statLog:
        level: 'WARN'
        path: './statLogs'
        filename: 'webserverMain.stat.2006.01.02.15.log'
        format: 'json'
      mongo:
        mongo_url: 'adfs:A26JQ34PTFWqxZ9PqV5EFB0iu@5.tz.mongodb.dynamic:27417,6.tz.mongodb.dynamic:27417,7.tz.mongodb.dynamic:27417/?authSource=adfs&replicaSet=co_adfs'
        track_url: 'topvdn:qjPLZ5H4y7MDFSW6vfxoU2gha@5.tz.mongodb.dynamic:27517,6.tz.mongodb.dynamic:27517,7.tz.mongodb.dynamic:27517/?authSource=topvdn&replicaSet=co_disktracker'
      token:
        appid: 'cpmq'
        appkey: '414dcb26882e4cdfc93b10152e82c8e4'
        appkeysurl: 'http://api.topvdn.com/API/apps/keys?since=%s'
        synctime: 60
      diskServer:
        zone: 1
        copyport: ':8192'
        mincopynum: 2
        spacequerytime: 90
        MountCommand: df -TH | grep nfs4 | awk '{print $2, $7}'
        storagepaths:
          -
            storageserver: '127.0.0.1'
            storageroot: /data/1
