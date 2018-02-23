MachineID: 1913968515
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
storage:
  local_ip: 192.168.1.13
  partitions:
  - {automount: 1, enable: 1, fs_type: ext4, server_port: 9001, uuid_index_backup: '65a8e9d7-b0fa-4323-9b12-84bed447a418', uuid_index: 'cfafae5c-f8d6-4cd3-87af-b762560a5f76', uuid_data: 'c5518b30-85d0-417a-9396-733d799bb0d6'}
  - {automount: 1, enable: 1, fs_type: ext4, server_port: 9002, uuid_index_backup: '4f12da58-e2d9-49ea-bfe2-9fb5e0db2647', uuid_index: '0f0c226c-dedf-4d86-b757-2738527c1a93', uuid_data: '02be6275-587d-4855-b9af-e2d814cf75b2'}
  - {automount: 1, enable: 1, fs_type: ext4, server_port: 9003, uuid_index_backup: '0c5b98ad-c8dd-45ea-9ef5-d2276a8e858b', uuid_index: '9606d777-59e5-4132-b098-9fd552d441f5', uuid_data: 'f03685a0-afcc-482e-b8fb-4fc004aaf7f6'}
  public_ip: 101.89.179.59
