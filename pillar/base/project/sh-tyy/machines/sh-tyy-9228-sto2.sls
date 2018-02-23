MachineID: 2098517951
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
  local_ip: 192.168.1.234
  partitions:
  - {automount: 1, enable: 1, fs_type: ext4, server_port: 9001, uuid_index_backup: '1a056a94-845c-42f5-89d4-ccc041f634fd', uuid_index: 'e4daf4b2-0b98-4ee7-89cc-0a6aa7ad3759', uuid_data: '4495415b-3f97-44a7-acd7-fd4483fa773c'}
  - {automount: 1, enable: 1, fs_type: ext4, server_port: 9002, uuid_index_backup: 'f5fc4672-e385-44c4-b5b2-75891c14d1c4', uuid_index: '7e682ea9-d708-41f0-b1e1-b6e56db4d93c', uuid_data: 'b0118d45-0284-4df2-9e64-baa28a24bbbe'}
  - {automount: 1, enable: 1, fs_type: ext4, server_port: 9003, uuid_index_backup: 'fe42f10e-c083-4de9-8a47-5124d06a9e48', uuid_index: '5cf1f7db-ead2-45d0-b064-cb8f51977d10', uuid_data: 'ad2e3e5e-f129-48c2-b920-d5c1d64e07b0'}
  - {automount: 1, enable: 1, fs_type: ext4, server_port: 9004, uuid_index_backup: '9a77cbdd-f77a-4204-97a9-33ba601cd3ea', uuid_index: 'd2b246e3-c05f-45df-9bfc-96b9db15a19e', uuid_data: '25c52e15-0294-422c-9ad8-017a7e936e52'}
  public_ip: 101.89.176.110
