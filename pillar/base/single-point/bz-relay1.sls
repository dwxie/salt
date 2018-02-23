MachineID: 255207036


elastic:
  filebeat:
    config:
      filebeat:
        prospectors:
          -
            paths:
              - '/opt/nginx-tool/logs/access.log'
            fields:
              -
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
        live:
          push_when_need:
            enable: False
          hls_enable: True
          record_enable: Flase
    http:
      server:
        hls:
          check_token: 'off'
        snapshot_enable: True
  config:
    connection_config:
      max_upload_bandwidth: 100
      max_download_connections: 300
      max_download_bandwidth: 100
      peer_id: 534773762
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
