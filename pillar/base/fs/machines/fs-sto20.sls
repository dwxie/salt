MachineID: 3403669773
cos:
  COStorage:
    config:
      local_ip: 192.168.2.246
      partitions:
      - {automount: 1, disk_type: 2, enable: 1, fs_type: ext4, query_port: 8101, upload_port: 9101,
        wwn: '0x50014ee2b835666d'}
      - {automount: 1, disk_type: 2, enable: 1, fs_type: ext4, query_port: 8102, upload_port: 9102,
        wwn: '0x50014ee20d9d9379'}
      - {automount: 1, disk_type: 2, enable: 1, fs_type: ext4, query_port: 8103, upload_port: 9103,
        wwn: '0x50014ee2b835945b'}
      - {automount: 1, disk_type: 2, enable: 1, fs_type: ext4, query_port: 8104, upload_port: 9104,
        wwn: '0x50014ee2b83586b0'}
      public_ip: 183.57.151.125
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
      enable: 0
      record_days: [7]
    connection_config: {max_download_bandwidth: 1000, max_download_connections: 1500,
      max_upload_bandwidth: 1000, peer_id: 534839297, relay_type: 31, rtmp_play_check_flag: 0,
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
storage:
  local_ip: 192.168.2.246
  partitions:
  - {automount: 1, enable: 1, fs_type: ext4, server_port: 9001, wwn: '0x50014ee20d8752e1'}
  - {automount: 1, enable: 1, fs_type: ext4, server_port: 9002, wwn: '0x50014ee20d88aec4'}
  - {automount: 1, enable: 1, fs_type: ext4, server_port: 9003, wwn: '0x50014ee20d8a6529'}
  - {automount: 1, enable: 1, fs_type: ext4, server_port: 9004, wwn: '0x50014ee20d8a981c'}
  - {automount: 1, enable: 1, fs_type: ext4, server_port: 9005, wwn: '0x50014ee2628d6121'}
  public_ip: 183.57.151.125
