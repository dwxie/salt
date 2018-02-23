cos:
  pigeon:
    config:
      core:
        bind: ':7789'
      topvdn:
        app_id: 'cpmq'
        app_key: '414dcb26882e4cdfc93b10152e82c8e4'
        update_app_interval: 10
        update_app_url: 'http://api.topvdn.com/API/apps/keys?since=%v'
      kafka:
        brokers: '192.168.2.31:9092,192.168.2.32:9092,192.168.2.33:9092'
        group_id: "ly-changsha-pigeon"
        query_timeout_ms: 500
        meta_refresh_interval_ms: 10000
        pool_min_size: 10
        pool_max_size: 50
