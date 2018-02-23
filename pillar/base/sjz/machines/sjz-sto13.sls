MachineID: 3420446989
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
storage:
  local_ip: 192.168.2.230
  partitions:
  - {automount: 1, enable: 1, fs_type: ext4, server_port: 9001, wwn: '0x50014ee20cf63a9b'}
  - {automount: 1, enable: 1, fs_type: ext4, server_port: 9002, wwn: '0x50014ee20cf865c8'}
  - {automount: 1, enable: 1, fs_type: ext4, server_port: 9003, wwn: '0x50014ee2624b6463'}
  - {automount: 1, enable: 1, fs_type: ext4, server_port: 9004, wwn: '0x50014ee2624b7dc4'}
  - {automount: 1, enable: 1, fs_type: ext4, server_port: 9005, wwn: '0x50014ee2624d78e1'}
  - {automount: 1, enable: 1, fs_type: ext4, server_port: 9006, wwn: '0x50014ee2624d851a'}
  - {automount: 1, enable: 1, fs_type: ext4, server_port: 9007, wwn: '0x50014ee2624e1b8b'}
  - {automount: 1, enable: 1, fs_type: ext4, server_port: 9008, wwn: '0x50014ee2b7a12045'}
  - {automount: 1, enable: 1, fs_type: ext4, server_port: 9009, wwn: '0x50014ee2b7a1399b'}
  - {automount: 1, enable: 1, fs_type: ext4, server_port: 9010, wwn: '0x50014ee2b7a13d75'}
  - {automount: 1, enable: 1, fs_type: ext4, server_port: 9011, wwn: '0x50014ee2b7a13eb6'}
  - {automount: 1, enable: 1, fs_type: ext4, server_port: 9012, wwn: '0x50014ee2b7a36ce7'}
  public_ip: 61.55.189.170
