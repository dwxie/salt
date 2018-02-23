MachineID: 3420446989
elastic:
  filebeat:
    config:
      filebeat:
        prospectors:
        - fields:
          - {type: http_access_log}
          fields_under_root: true
          paths: [/opt/nginx-tool/logs/access.log]
        - fields:
          - {type: rtmp_access_log}
          fields_under_root: true
          paths: [/opt/nginx-tool/logs/rtmp_access.log]
relay:
  config:
    circle_storage_config:
      enable: 0
      record_days: [7]
    connection_config: {max_download_bandwidth: 500, max_download_connections: 1500,
      max_upload_bandwidth: 500, peer_id: 534970369, relay_type: 31, rtmp_play_check_flag: 0,
      stream_event_notify_type: 0}
    event_storage_config: {support_event_alarm_command: 0, type: 0}
    h264_save_config: {enable: 1, live_enable: 1, storage_enable: 0}
    tracker_serverlist_config: []
  nginx:
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
    rtmp:
      server:
        live:
          hls_enable: false
          push_when_need: {enable: false}
          record_enable: false
  role: 1F
