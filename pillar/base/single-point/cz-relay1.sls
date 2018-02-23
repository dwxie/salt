MachineID: 3307331853


elastic:
  filebeat:
    config:
      filebeat:
        prospectors:
          -
            paths:
              - '/opt/nginx-tool/logs/access.log'
            fields:
              type: 'http_access_log'
            fields_under_root: true
          -
            paths:
              - '/opt/nginx-tool/logs/rtmp_access.log'
            fields:
              type: rtmp_access_log
            fields_under_root: true
          -
            paths:
              - '/opt/nginx-tool/sbin/rtmp_business.log'
            fields:
              type: rtmp_bussiness
            fields_under_root: true


relay:
  role: '1F'
  nginx:
    rtmp:
      server:
        listen:
          - 1935
        live:
          push_when_need:
            enable: false
          hls_enable: false
          record_enable: false
    http:
      proxy_cache_paths:
      - inactive: 60s
        keys_zone: {name: cache_hls, size: 10m}
        max_size: 1g
        path: /tmp/hls
      server:
        hls: {check_token: 'off'}
        live:
          proxy:
            ts:
              proxy_cache: {enable: true, zone: cache_hls}
        snapshot_enable: true
  config:
    connection_config:
      max_upload_bandwidth: 100
      max_download_connections: 300
      max_download_bandwidth: 100
      peer_id: 534773765
      relay_type: 27
      rtmp_play_check_flag: 0
      stream_event_notify_type: 0
    h264_save_config:
      enable: 1
      live_enable: 1
      storage_enable: 0
    circle_storage_config:
      enable: 0
      record_days:
        - 7
    event_storage_config:
      type: 0
      support_event_alarm_command: 0
    tracker_serverlist_config: []
