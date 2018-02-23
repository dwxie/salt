cos:
  pigeon:
    config:
      core:
        bind: ':7789'
      topvdn:
        app_id: 'uica'
        app_key: '49zx87q50574z6518wu127i4r26m2935'
        update_app_interval: 10
        update_app_url: 'http://jxsr-api.antelopecloud.cn/API/apps/keys?since=%v'
      kafka:
        brokers: '192.168.2.52:9092,192.168.2.53:9092,192.168.2.54:9092'
        group_id: "ly-psrnc-pigeon"
        query_timeout_ms: 100
        meta_refresh_interval_ms: 10000
        pool_min_size: 10
        pool_max_size: 50
        max_empty_try: 2
