disktracker:
  SERVICE:
    port: 5730
  MONGOHOST:
    host: 'mongodb://topvdn:XwkqUz2a8cN8yAuHTMgXJAEC@192.168.2.211:27017,192.168.2.212:27017/?authSource=topvdn&replicaSet=index'
  AREA:
    id: 1
    name: 'foshan'
    did_begin: 537853952
    did_end: 537919487
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
