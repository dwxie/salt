disktracker:
  SERVICE:
    port: 5730
  MONGOHOST:
    host: 'mongodb://topvdn:XwkqUz2a8cN8yAuHTMgXJAEC@192.168.2.15:27017,192.168.2.18:27017,192.168.2.21:27017/topvdn?replicaSet=index'
  AREA:
    id: 5
    name: 'changsha'
    did_begin: 537788416
    did_end: 537853951
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
    timeout_exchange: 1800
    reserve_min: 12
    onlines_min: 10
    timeout_env_stable: 60
  PERSIST:
    days_gload: 7
    days_group: 7
    days_discstate: 7
