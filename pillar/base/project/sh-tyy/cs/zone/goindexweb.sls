cs:
  zone:
    goindexweb:
      config:
        core:
          bind: '0.0.0.0:8005'
          inner_host: '127.0.0.1:8006'
        topvdn:
          app_id: 'eakl'
          app_key: '5fn6tku1q06p15fvbwtu8avesyljt193'
          update_app_interval: 30
          update_app_url: 'https://shty-api.antelopecloud.cn/API/apps/keys?since=%v'
        libs:
          lib_remuxing: '/var/www/index_web/libs/remuxing/libremuxing.so'
          lib_flvdownload: '/var/www/index_web/libs/flvdownload/libflvdownload.so'
        record:
          ts_path: '/data2/index_web/hls'
          flv_path: '/data2/index_web/flv'
          playdata_url: 'http://%v/v2/record/%v/playdata?from=%v&to=%v&client_token=%v&inner=1'
        debug:
          bind: '127.0.0.1:6060'
          perf_enable: false
