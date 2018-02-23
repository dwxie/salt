cos:
  codisktracker:
    config:
      generl:
        areaid: 5
        serverport: 8200
        queryport: 8201
        didbegin: 537788416
        didend: 537853951
        timeoffline: 10800
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
    old_config:
      SERVICE:
        port: 5730
      MONGOHOST:
        host: 'mongodb://topvdn:qjPLZ5H4y7MDFSW6vfxoU2gha@192.168.2.31:27517,192.168.2.32:27517,192.168.2.33:27517/?authSource=topvdn&replicaSet=co_disktracker'
      AREA:
        id: 5
        name: 'changsha'
        did_begin: 537788416
        did_end: 537853951
      CUSTOM:
        privateflag: 0
        storagedays: 3
      GROUP:
        groupby: 0
        cycletypes:
          -
            cycletype: 7
            groupcount: 3
          -
            cycletype: 30
            groupcount: 1
      DISK:
        timeout_offline: 30
        timeout_exchange: 604800
        reserve_min: 0
        onlines_min: 10
        timeout_env_stable: 60
      PERSIST:
        days_gload: 30
        days_group: 30
        days_discstate: 30
