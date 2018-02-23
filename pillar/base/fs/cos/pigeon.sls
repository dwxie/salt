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
        brokers: '5.kafka.private:9092,6.kafka.private:9092,7.kafka.private:9092'
        group_id: "ly-foshan-pigeon"
        query_timeout_ms: 500
        meta_refresh_interval_ms: 10000
        pool_min_size: 10
        pool_max_size: 50
