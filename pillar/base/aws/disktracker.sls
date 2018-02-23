disktracker:
  SERVICE:
    port: 5730
  MONGOHOST:
    host: 'mongodb://topvdn:Megaium!172.31.15.49:27017/topvdn'
  AREA:
    id: 9
    name: 'aws'
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
    reserve_min: 0
    onlines_min: 10
    timeout_env_stable: 60
  PERSIST:
    days_gload: 30
    days_group: 30
    days_discstate: 30
