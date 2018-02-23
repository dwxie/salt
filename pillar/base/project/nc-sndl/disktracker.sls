disktracker:
  SERVICE:
    port: 5730
    query_port: 5731
  MONGOHOST:
    host: 'mongodb://topvdn:r3aK291srKSjGihelYzoeY2Q@192.168.2.12:27017,192.168.2.22:27017,192.168.2.32:27017/topvdn?replicaSet=mo_psrnc'
  AREA:
    id: 1
    name: 'psrnc'
    did_begin: 538312704
    did_end: 538378239
  GROUP:
    groupby: 0
    cycletypes:
      -
        cycletype: 7
        groupcount: 4
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
