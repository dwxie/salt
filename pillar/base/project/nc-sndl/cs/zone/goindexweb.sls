cs:
  zone:
    goindexweb:
      config:
        core:
          bind: '0.0.0.0:8005'
          inner_host: '127.0.0.1:8004'
        topvdn:
          app_id: 'sumf'
          app_key: '5b3a49ce860d357d9be89d282d64dba9'
          update_app_interval: 30
          update_app_url: 'https://jxsr-api.antelopecloud.cn/API/apps/keys?since=%v'
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
