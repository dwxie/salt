cos:
  codisktracker:
    config:
      generl:
        areaid: 1
        serverport: 8200
        queryport: 8201
        didbegin: 537853952
        didend: 537919487
        timeoffline: 30
        timeexchange: 604800
        timeenvstable: 120
        reservemin: 0
        onlinesmin: 10
        httpsyncnum: 2
      log:
        level: INFO
        path: ./logs
        filename: 'codisktracker.2006.01.02.log'
      mongo:
        dbname: 'topvdn'
        host: 'topvdn:qjPLZ5H4y7MDFSW6vfxoU2gha@5.mongodb.private:27517,6.mongodb.private:27517,7.mongodb.private:27517/topvdn'
        glhkeepdays: 30
        ghkeepdays: 30
      cycleobjgroup:
        privateflag: 0
        cycle: 3
      objectGroup:
        fragmentRate: 0.4
        timedamage: 3600
    tool:
      codisktrackertool:
        config:
          generl:
            diskTrack_URL: 'http://codisktracker.private:8201'
            user_token: '1003775_3145728_1577429797_abf24269c1b163a04a4090643a82f411'
          log:
            level: 'INFO'
            path: './logs'
            filename: 'codisktrackertool.2006.01.02.log'
      dbmigrationtool:
        config:
          generl:
            dbname: 'topvdn'
            mongo: 'mongodb://topvdn:qjPLZ5H4y7MDFSW6vfxoU2gha@5.mongodb.private:27517,6.mongodb.private:27517,7.mongodb.private:27517/topvdn'
            cycleobjmogo: 'mongodb://topvdn:qjPLZ5H4y7MDFSW6vfxoU2gha@5.mongodb.private:27517,6.mongodb.private:27517,7.mongodb.private:27517/topvdn'
          log:
            level: 'INFO'
            path: './logs'
            filename: 'dbmigrationtool.2006.01.02.log'
