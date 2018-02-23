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
      enable: 1
      record_days: [7, 30]
      record_statistics_flag: 1
    connection_config: {audio_pass_back: 1, max_download_bandwidth: 100, max_download_connections: 500,
      max_upload_bandwidth: 300, peer_id: 3489660935, public_rtmp_record_flag: 1,
      relay_type: 208}
    event_storage_config: {support_event_alarm_command: 0, type: 0}
    h264_save_config: {enable: 1, live_enable: 1, storage_enable: 1}
    relay_config:
      target: ['192.168.2.243:1935', '61.55.189.174:1935', '112.84.133.130:1935',
        '42.81.21.52:1935', '183.57.151.125:1935']
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
          push_when_need: {enable: true, heartbeat_time: 5}
          record_enable: true
  role: D0
