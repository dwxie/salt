MachineID: 1774493765
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
      enable: 1
      record_days: [7, 30]
    connection_config: {audio_pass_back: 1, max_download_bandwidth: 500, max_download_connections: 700,
      max_upload_bandwidth: 500, peer_id: 3221225475, relay_type: 192}
    event_storage_config: {support_event_alarm_command: 1, type: 0}
    h264_save_config: {enable: 1, live_enable: 1, storage_enable: 1}
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
          record_enable: true
  role: C0
