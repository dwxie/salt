MachineID: 1796527895
relay:
  config:
    circle_storage_config:
      enable: 1
      record_days: [7]
    connection_config: {audio_pass_back: 1, max_download_bandwidth: 1000, max_download_connections: 1000,
      max_upload_bandwidth: 1000, peer_id: 3221225473, relay_name: sh-tyy-9228-sto1,
      relay_type: 192}
    event_storage_config: {support_event_alarm_command: 1, type: 0}
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
  role: C0
smpagent:
  plugins:
    collector:
      collector:
        config:
          tasks:
          - {args: python /opt/smpagent/scrpits/get_info/get_info.py, collector: cmd,
            cron: 1 * * * * *, type: service_sys}
          - {args: 'http://127.0.0.1:80/info', collector: http, cron: 1 * * * * *,
            type: service_relay}
          - {args: 'http://127.0.0.1:8001/stat/globalinfo', collector: http, cron: 1
              * * * * *, type: service_disk}
          - {args: 'http://127.0.0.1:8002/stat/globalinfo', collector: http, cron: 1
              * * * * *, type: service_disk}
          - {args: 'http://127.0.0.1:8003/stat/globalinfo', collector: http, cron: 1
              * * * * *, type: service_disk}
          - {args: 'http://127.0.0.1:8004/stat/globalinfo', collector: http, cron: 1
              * * * * *, type: service_disk}
storage:
  local_ip: 192.168.1.34
  partitions:
  - {automount: 1, enable: 1, fs_type: ext4, server_port: 9001, uuid_index_backup: '33401d96-6e3f-4cbf-96e6-823617e21274', uuid_index: 'c29dd6d4-dc29-4180-9893-3bce3c053938', uuid_data: '7e444e4e-d510-4fdd-978b-364b46d4db61'}
  - {automount: 1, enable: 1, fs_type: ext4, server_port: 9002, uuid_index_backup: '04fd9067-ee84-4950-b350-cd3cebf92a07', uuid_index: '6e6177b4-ab35-4736-b853-8c4ed057734f', uuid_data: 'fcd76a5d-1ede-4177-a5b6-dd0f7564392a'}
  - {automount: 1, enable: 1, fs_type: ext4, server_port: 9003, uuid_index_backup: '2506bcec-b018-49ec-8d15-8e1ddb5f990d', uuid_index: 'e8ef5c2a-6dee-45f4-93b0-257a320fc5d2', uuid_data: '4d16ac83-2530-4256-bcec-a744a6013840'}
  - {automount: 1, enable: 1, fs_type: ext4, server_port: 9004, uuid_index_backup: '7a825ddf-75f9-4bc4-a8d7-1cfc31da9f31', uuid_index: '003201a4-8e2f-486f-8b14-7a668a8acddc', uuid_data: 'a2fea65a-49d5-4894-a9c0-c1966895790d'}
  public_ip: 101.89.179.130
