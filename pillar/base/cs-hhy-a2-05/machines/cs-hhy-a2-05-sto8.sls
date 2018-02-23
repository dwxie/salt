MachineID: 1439760653
cos:
  COStorage:
    config:
      local_ip: 192.168.2.9
      partitions:
      - {automount: 1, disk_type: 2, enable: 1, fs_type: ext4, query_port: 8101, upload_port: 9101,
        wwn: '0x5000c50079aa270c'}
      - {automount: 1, disk_type: 2, enable: 1, fs_type: ext4, query_port: 8102, upload_port: 9102,
        wwn: '0x5000c50079aa2d95'}
      - {automount: 1, disk_type: 2, enable: 1, fs_type: ext4, query_port: 8103, upload_port: 9103,
        wwn: '0x5000c50079aa3a43'}
      - {automount: 1, disk_type: 2, enable: 1, fs_type: ext4, query_port: 8104, upload_port: 9104,
        wwn: '0x5000c50079aa3fff'}
      public_ip: 103.38.42.76
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
        - fields:
          - {type: rtmp_billing}
          fields_under_root: true
          paths: [/opt/nginx-tool/sbin/rtmp_record.log]
        - fields:
          - {type: rtmp_record_event}
          fields_under_root: true
          paths: [/opt/nginx-tool/sbin/rtmp_record_event.log]
relay:
  config:
    circle_storage_config:
      enable: 1
      record_days: [7, 30]
      record_statistics_flag: 1
    connection_config: {audio_pass_back: 1, max_download_bandwidth: 500, max_download_connections: 1000,
      max_upload_bandwidth: 500, peer_id: 2684354564, relay_type: 160}
    event_storage_config: {support_event_alarm_command: 1, type: 0}
    h264_save_config: {enable: 1, live_enable: 1, storage_enable: 1}
  nginx:
    http:
      server:
        hls: {check_token: 'off'}
        info_enable: true
        snapshot_enable: true
    rtmp:
      server:
        live:
          hls_enable: true
          push_when_need: {enable: false}
          record_enable: true
  role: A0
storage:
  local_ip: 192.168.2.9
  partitions:
  - {automount: 1, enable: 1, fs_type: ext4, server_port: 9001, wwn: '0x50014ee262e00eac'}
  - {automount: 1, enable: 1, fs_type: ext4, server_port: 9002, wwn: '0x5000c50079a9bc65'}
  - {automount: 1, enable: 1, fs_type: ext4, server_port: 9003, wwn: '0x5000c50079aa2864'}
  - {automount: 1, enable: 1, fs_type: ext4, server_port: 9004, wwn: '0x5000c50079a9c42a'}
  - {automount: 1, enable: 1, fs_type: ext4, server_port: 9005, wwn: '0x5000c50079aa11a6'}
  public_ip: 103.38.42.76
