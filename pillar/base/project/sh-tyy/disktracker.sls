disktracker:
  SERVICE:
    port: 5730
    query_port: 5731
  MONGOHOST:
    host: 'mongodb://topvdn:RcjC677y7V9qm6gCT7c8P5r3G@192.168.1.179:27017/topvdn'
  AREA:
    id: 1
    name: 'shty'
    did_begin: 538640384
    did_end: 538705919
  GROUP:
    groupby: 0
    cycletypes:
      -
        cycletype: 7
        groupcount: 1
  DISK:
    timeout_offline: 30
    timeout_exchange: 1800
    reserve_min: 0
    onlines_min: 10
    timeout_env_stable: 60
  PERSIST:
    days_gload: 7
    days_group: 7
    days_discstate: 7
