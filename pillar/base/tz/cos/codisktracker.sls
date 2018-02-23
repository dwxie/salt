cos:
  CODisktracker:
    config:
      SERVICE:
        port: 5730
      MONGOHOST:
        host: 'mongodb://topvdn:qjPLZ5H4y7MDFSW6vfxoU2gha@192.168.2.248:27517,192.168.2.249:27517/?authSource=topvdn&replicaSet=co_disktracker'
      AREA:
        id: 3
        name: 'taizhou'
        did_begin: 537919488
        did_end: 537985023
      GROUP:
        groupby: 0
        cycletypes:
          -
            cycletype: 7
            groupcount: 3
          -
            cycletype: 30
            groupcount: 1
          -
            cycletype: 60
            groupcount: 1
      DISK:
        timeout_offline: 30
        timeout_exchange: 7200
        reserve_min: 12
        onlines_min: 10
        timeout_env_stable: 60
      PERSIST:
        days_gload: 30
        days_group: 30
        days_discstate: 30
