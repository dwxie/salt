MachineID: 1422983437
cos:
  COStorage:
    config:
      local_ip: 192.168.2.218
      partitions:
      - {automount: 1, disk_type: 2, enable: 1, fs_type: ext4, query_port: 8101, upload_port: 9101,
        wwn: '0x50014ee20ce08140'}
      - {automount: 1, disk_type: 2, enable: 1, fs_type: ext4, query_port: 8102, upload_port: 9102,
        wwn: '0x50014ee2b78b7084'}
      - {automount: 1, disk_type: 2, enable: 1, fs_type: ext4, query_port: 8103, upload_port: 9103,
        wwn: '0x50014ee20ce06957'}
      - {automount: 1, disk_type: 2, enable: 1, fs_type: ext4, query_port: 8104, upload_port: 9104,
        wwn: '0x50014ee20ce06dbf'}
      public_ip: 61.55.189.145
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
      max_upload_bandwidth: 500, peer_id: 2684354562, relay_type: 160}
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
  role: A0
storage:
  local_ip: 192.168.2.218
  partitions:
  - {automount: 1, enable: 1, fs_type: ext4, server_port: 9007, wwn: '0x50014ee2b78b7057'}
  - {automount: 1, enable: 1, fs_type: ext4, server_port: 9008, wwn: '0x50014ee20ce088cd'}
  - {automount: 1, enable: 1, fs_type: ext4, server_port: 9009, wwn: '0x50014ee2b78da263'}
  - {automount: 1, enable: 1, fs_type: ext4, server_port: 9010, wwn: '0x50014ee20ce06880'}
  - {automount: 1, enable: 1, fs_type: ext4, server_port: 9011, wwn: '0x50014ee20ce29867'}
  - {automount: 1, enable: 1, fs_type: ext4, server_port: 9012, wwn: '0x50014ee26237cd09'}
  public_ip: 61.55.189.145
