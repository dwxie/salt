cos:
  codispatcher:
    config:
      general:
        rpcServer: 127.0.0.1
        rpcPort: :8130
      web:
        protocol: http
        debugPort: :6030
        statusPort: :8030
        certFile: idfile
        keyFile:  idfile.key
        syncnum: 200
        debug: false
      log:
        level: 'INFO'
        path: './logs'
        filename: 'codispatcher.2006.01.02.log'
      loopStrategy:
        MountCommand: df -TH | grep nfs4 | awk '{print $2, $7}'
        diskTrack_IP: 'codisktracker.private'
        diskTrackWeb_Port: 8201
        diskTrack_Port: 8200
        diskNginxPort: 8100
        encodeThreadNum: 3
        runMode: 1
        diskType: 2
        peerID: 1
        cycle: 1
        indexServerList: []
        M: 8
        N: 4
        MinSize: 1024
        MaxSize: 1073741824
        MaxErrorCount: 2
