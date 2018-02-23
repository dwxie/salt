MachineID: 3977566004
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
storage:
  local_ip: 192.168.1.149
  partitions:
  - {automount: 1, enable: 1, fs_type: ext4, server_port: 9001, uuid_index_backup: '7949b969-af9e-42fe-8900-e93c042a5d0b', uuid_index: '09daad9f-69db-471b-83f1-bfbf8cdccc5c', uuid_data: '1e3f126f-dc01-4a42-9840-d5f87bde7374'}
  - {automount: 1, enable: 1, fs_type: ext4, server_port: 9002, uuid_index_backup: 'ec0917ae-5de3-46dc-a74c-2e90bb917149', uuid_index: 'fe19a1f3-b930-4600-a355-ec4e5e783234', uuid_data: '67c18a4d-807f-4afa-ba99-97ebb085700e'}
  - {automount: 1, enable: 1, fs_type: ext4, server_port: 9003, uuid_index_backup: '95e77f51-9af6-4b65-810b-8bcdbc7ddd9d', uuid_index: 'f9498d13-1939-4e11-95e1-812773702fbc', uuid_data: 'bbd278c1-de61-450b-a528-ef4b196da8f7'}
  - {automount: 1, enable: 1, fs_type: ext4, server_port: 9004, uuid_index_backup: '7767810f-b72a-48fa-8543-9f2692dee5ae', uuid_index: 'bf47be40-30a2-46e0-91a9-3d9afe71daf4', uuid_data: 'c7cb03d4-94e0-4874-9485-9dabfeeddefd'}
  public_ip: 101.89.191.40
