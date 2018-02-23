MachineID: 1711845648
cos:
  COStorage:
    config:
      local_ip: 192.168.2.45
      partitions:
      - {automount: 1, disk_type: 2, enable: 1, fs_type: ext4, query_port: 8101, upload_port: 9101,
        wwn: '0x5000c500a36b7c2b'}
      - {automount: 1, disk_type: 2, enable: 1, fs_type: ext4, query_port: 8102, upload_port: 9102,
        wwn: '0x5000c500a36b4626'}
      - {automount: 1, disk_type: 2, enable: 1, fs_type: ext4, query_port: 8103, upload_port: 9103,
        wwn: '0x5000c500a34b5f90'}
      - {automount: 1, disk_type: 3, enable: 1, fs_type: ext4, query_port: 8104, upload_port: 9104,
        wwn: '0x5000c500a36952e6'}
      - {automount: 1, disk_type: 3, enable: 1, fs_type: ext4, query_port: 8105, upload_port: 9105,
        wwn: '0x5000c500a36be6e1'}
      - {automount: 1, disk_type: 3, enable: 1, fs_type: ext4, query_port: 8106, upload_port: 9106,
        wwn: '0x5000c500a366ae62'}
      public_ip: 218.95.36.45
smpagent:
  plugins:
    collector:
      collector:
        config:
          tasks:
          - {args: python /opt/smpagent/scrpits/get_info/get_info.py, collector: cmd,
            cron: 1 * * * * *, type: service_sys}
          - {args: 'http://127.0.0.1:8001/stat/globalinfo', collector: http, cron: 1
              * * * * *, type: service_disk}
          - {args: 'http://127.0.0.1:8002/stat/globalinfo', collector: http, cron: 1
              * * * * *, type: service_disk}
          - {args: 'http://127.0.0.1:8003/stat/globalinfo', collector: http, cron: 1
              * * * * *, type: service_disk}
          - {args: 'http://127.0.0.1:8004/stat/globalinfo', collector: http, cron: 1
              * * * * *, type: service_disk}
          - {args: 'http://127.0.0.1:8005/stat/globalinfo', collector: http, cron: 1
              * * * * *, type: service_disk}
          - {args: 'http://127.0.0.1:8006/stat/globalinfo', collector: http, cron: 1
              * * * * *, type: service_disk}
storage:
  local_ip: 192.168.2.45
  partitions:
  - {automount: 1, enable: 1, fs_type: ext4, server_port: 9001, wwn: '0x5000c500a3a5a3ab'}
  - {automount: 1, enable: 1, fs_type: ext4, server_port: 9002, wwn: '0x5000c500a3a5eb0b'}
  - {automount: 1, enable: 1, fs_type: ext4, server_port: 9003, wwn: '0x5000c500a3a6139b'}
  - {automount: 1, enable: 1, fs_type: ext4, server_port: 9004, wwn: '0x5000c500a36b4c9c'}
  - {automount: 1, enable: 1, fs_type: ext4, server_port: 9005, wwn: '0x5000c500a3a5aa53'}
  - {automount: 1, enable: 1, fs_type: ext4, server_port: 9006, wwn: '0x5000c500a3a63702'}
  public_ip: 218.95.36.45
