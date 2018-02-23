relay:
  role: '1F'
  nginx:
    events:
      worker_connections: 65536
    rtmp:
      server:
        listen:
          - 1970
        live:
          push_when_need:
            enable: True
            heartbeat_time: 5
          hls_enable: Flase
          record_enable: Flase
    http:
      server:
        listen:
          - 82
          - 8082
        hls:
          check_token: 'off'
        live:
          check_token: 'on'
          proxy:
            ts:
              proxy_cache:
                enable: False
        snapshot_enable: False
  config:
    connection_config:
      max_upload_bandwidth: 1000
      max_download_connections: 1000
      max_download_bandwidth: 1000
      peer_id: 534053890
      relay_type: 30
      stream_event_notify_type: 0
    h264_save_config:
      enable: 0
      live_enable: 0
      storage_enable: 0
    circle_storage_config:
      enable: 0
      record_days:
        - 7
    event_storage_config:
      type: 0
      support_event_alarm_command: 0
    relay_config:
      target:
        - '192.168.2.8:1935'
        - '42.81.21.52:1935'
        - '183.57.151.125:1935'
    tracker_serverlist_config: []
