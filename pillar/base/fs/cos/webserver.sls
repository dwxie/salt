cos:
  WebServer:
    config:
      web:
        protocol: 'http'
        eventDownloadAddr: 'https://oss1.topvdn.com'
        port: ':8088'
        debugPort: ':6060'
        certFile: 'idfile'
        keyFile: 'idfile.key'
        syncnum: 200
        debug: false
        maxMessageLen: 128
        uploadEventFlag: 1
      log:
        level: 'INFO'
        path: './logs'
        filename: 'webserver.2006.01.02.log'
        format: 'text'
      statLog:
        level: 'WARN'
        path: './statLogs'
        filename: 'webserver.stat.2006.01.02.log'
        format: 'json'
      recoveryLog:
        level: 'WARN'
        path: './recoveryLogs'
        filename: 'webserver.recovery.2006.01.02.log'
        format: 'json'
      uploadRecoveryLog:
        path: './uploadRecoveryLogs'
      mongo:
        mongo_url: 'adfs:A26JQ34PTFWqxZ9PqV5EFB0iu@5.mongodb.private:27417,6.mongodb.private:27417,7.mongodb.private:27417/?authSource=adfs&replicaSet=co_adfs'
      token:
        appid: 'cpmq'
        appkey: '414dcb26882e4cdfc93b10152e82c8e4'
        appkeysurl: 'http://api.topvdn.com/API/apps/keys?since=%s'
        synctime: 60
      diskServer:
        zone: 5
        privateFlag: False
        node: 1
        copyport: ':8192'
        mincopynum: 2
        spacequerytime: 90
        MountCommand: df -TH | grep nfs4 | awk '{print $2, $7}'
        coNginxPort: 8100
        storagepaths:
          -
            storageserver: '127.0.0.1'
            storageroot: /data/1
        tracker_host: 'http://codisktracker.private:8201'
        tracker_token: '1003775_3145728_1577429797_abf24269c1b163a04a4090643a82f411'
      kafkaServer:
        brokens:
          - 192.168.2.216:9092
          - 192.168.2.217:9092
          - 192.168.2.218:9092
