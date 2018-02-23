MachineID: 1439760653
cos:
  codispatcher:
    config:
      general: {rpcServer: 192.168.2.32}
      loopStrategy:
        encodeThreadNum: 1
        runMode: 3
        peerID: 436207621
        indexServerList:
          - serverIP: 127.0.0.1
            rpcPort: :8041
            relayWebPort: :80
  COStorage:
    config:
      local_ip: 192.168.2.12
      partitions:
      - {automount: 1, disk_type: 2, enable: 1, fs_type: ext4, query_port: 8101, upload_port: 9101,
        wwn: '0x50014ee262dfb118'}
      - {automount: 1, disk_type: 2, enable: 1, fs_type: ext4, query_port: 8102, upload_port: 9102,
        wwn: '0x50014ee2b7d22ec6'}
      - {automount: 1, disk_type: 2, enable: 1, fs_type: ext4, query_port: 8103, upload_port: 9103,
        wwn: '0x50014ee2b7d24a17'}
      - {automount: 1, disk_type: 2, enable: 1, fs_type: ext4, query_port: 8104, upload_port: 9104,
        wwn: '0x50014ee262da956b'}
      public_ip: 103.38.42.79
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
    connection_config: {max_download_bandwidth: 1000, max_download_connections: 1000,
      max_upload_bandwidth: 1000, peer_id: 535101441, zone_id: 5, node_id: 17, relay_type: 27,
      stream_event_notify_type: 0}
    event_storage_config: {support_event_alarm_command: 1, type: 0}
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
          record_enable: false
          slice_enable: true
  role: NF
storage:
  local_ip: 192.168.2.12
  partitions:
  - {automount: 1, enable: 1, fs_type: ext4, server_port: 9001, wwn: '0x50014ee262dad2bd'}
  - {automount: 1, enable: 1, fs_type: ext4, server_port: 9002, wwn: '0x50014ee2b928d262'}
  - {automount: 1, enable: 1, fs_type: ext4, server_port: 9003, wwn: '0x50014ee262dfc4d8'}
  - {automount: 1, enable: 1, fs_type: ext4, server_port: 9004, wwn: '0x50014ee262df8de4'}
  - {automount: 1, enable: 1, fs_type: ext4, server_port: 9005, wwn: '0x50014ee262dc7da4'}
  public_ip: 103.38.42.79
