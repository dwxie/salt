MachineID: 4057923845
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
        - fields: {type: rtmp_bussiness}
          fields_under_root: true
          paths: [/opt/nginx-tool/sbin/rtmp_business.log]
relay:
  config:
    circle_storage_config:
      enable: 0
      record_days: [7]
    connection_config: {max_download_bandwidth: 1000, max_download_connections: 1500,
      max_upload_bandwidth: 1000, peer_id: 534904833, relay_type: 31, rtmp_play_check_flag: 0,
      stream_event_notify_type: 0}
    event_storage_config: {support_event_alarm_command: 0, type: 0}
    h264_save_config: {enable: 1, live_enable: 1, storage_enable: 0}
    tracker_serverlist_config: []
  nginx:
    http:
      server:
        hls: {check_token: 'off'}
        live: {check_token: 'off'}
        snapshot_enable: true
    rtmp:
      server:
        live:
          hls_enable: true
          push_when_need: {enable: false}
          record_enable: Flase
  role: 1F
