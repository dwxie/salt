MachineID: 1389429005
cos:
  COStorage:
    config:
      local_ip: 192.168.2.222
      partitions:
      - {automount: 1, enable: 1, fs_type: ext4, query_port: 8101, upload_port: 9101,
        wwn: '0x50014ee261bcb974'}
      - {automount: 1, enable: 1, fs_type: ext4, query_port: 8102, upload_port: 9102,
        wwn: '0x50014ee261b5762d'}
      - {automount: 1, enable: 1, fs_type: ext4, query_port: 8103, upload_port: 9103,
        wwn: '0x50014ee20c697386'}
      - {automount: 1, enable: 1, fs_type: ext4, query_port: 8104, upload_port: 9104,
        wwn: '0x50014ee20c679dbc'}
      public_ip: 122.226.181.117
elastic:
  filebeat:
    config:
      filebeat:
        prospectors:
        - fields:
          - {type: storage_billing}
          fields_under_root: true
          paths: [/opt/storage/stat_info.log]
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
    connection_config: {audio_pass_back: 1, max_download_bandwidth: 500, max_download_connections: 600,
      max_upload_bandwidth: 500, peer_id: 3221225522, relay_type: 192}
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
storage:
  local_ip: 192.168.2.222
  partitions:
  - {automount: 1, enable: 1, fs_type: ext4, server_port: 9007, wwn: '0x50014ee261bc6e06'}
  - {automount: 1, enable: 1, fs_type: ext4, server_port: 9008, wwn: '0x50014ee261bc7e98'}
  - {automount: 1, enable: 1, fs_type: ext4, server_port: 9009, wwn: '0x50014ee20c6734d3'}
  - {automount: 1, enable: 1, fs_type: ext4, server_port: 9010, wwn: '0x50014ee20c6798d9'}
  - {automount: 1, enable: 1, fs_type: ext4, server_port: 9011, wwn: '0x50014ee261bcdd01'}
  - {automount: 1, enable: 1, fs_type: ext4, server_port: 9012, wwn: '0x50014ee2b7122c12'}
  public_ip: 122.226.181.117
