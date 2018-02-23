MachineID: 3420446989
cos:
  COStorage:
    config:
      local_ip: 192.168.2.11
      partitions:
      - {automount: 1, disk_type: 2, enable: 1, fs_type: ext4, query_port: 8101, upload_port: 9101,
        wwn: '0x50014ee262daa193'}
      - {automount: 1, disk_type: 2, enable: 1, fs_type: ext4, query_port: 8102, upload_port: 9102,
        wwn: '0x50014ee262dc53a0'}
      - {automount: 1, disk_type: 2, enable: 1, fs_type: ext4, query_port: 8103, upload_port: 9103,
        wwn: '0x50014ee262dc6771'}
      - {automount: 1, disk_type: 2, enable: 1, fs_type: ext4, query_port: 8104, upload_port: 9104,
        wwn: '0x50014ee262dc7656'}
      public_ip: 103.38.42.78
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
      max_upload_bandwidth: 500, peer_id: 3221225520, relay_type: 192}
    event_storage_config: {support_event_alarm_command: 1, type: 0}
    h264_save_config: {enable: 1, live_enable: 1, storage_enable: 1}
  nginx:
    http:
      server:
        hls: {check_token: 'off'}
        snapshot_enable: true
    rtmp:
      server:
        live:
          hls_enable: true
          push_when_need: {enable: false}
          record_enable: true
  role: C0
storage:
  local_ip: 192.168.2.11
  partitions:
  - {automount: 1, enable: 1, fs_type: ext4, server_port: 9001, wwn: '0x50014ee20d26fbb7'}
  - {automount: 1, enable: 1, fs_type: ext4, server_port: 9002, wwn: '0x50014ee20d30da37'}
  - {automount: 1, enable: 1, fs_type: ext4, server_port: 9003, wwn: '0x50014ee262dc4541'}
  - {automount: 1, enable: 1, fs_type: ext4, server_port: 9004, wwn: '0x50014ee20d8a8165'}
  - {automount: 1, enable: 1, fs_type: ext4, server_port: 9005, wwn: '0x50014ee262d72778'}
  public_ip: 103.38.42.78
