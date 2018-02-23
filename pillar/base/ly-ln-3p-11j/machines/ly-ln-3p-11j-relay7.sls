MachineID: 263527916
elastic:
  filebeat:
    config:
      filebeat:
        prospectors:
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
    connection_config: {audio_pass_back: 1, max_download_bandwidth: 1000, max_download_connections: 1500,
      max_upload_bandwidth: 1000, peer_id: 535101441, relay_type: 31, rtmp_play_check_flag: 0,
      stream_event_notify_type: 0}
    event_storage_config: {support_event_alarm_command: 0, type: 0}
    h264_save_config: {enable: 1, live_enable: 1, storage_enable: 0}
    tracker_serverlist_config: []
  nginx:
    http:
      proxy_cache_paths:
      - inactive: 60s
        keys_zone: {name: cache_hls, size: 10m}
        max_size: 1g
        path: /tmp/hls
      server:
        hls: {check_token: 'off'}
        live:
          check_token: 'off'
          proxy:
            ts:
              proxy_cache: {enable: true, zone: cache_hls}
        snapshot_enable: true
    rtmp:
      server:
        live:
          hls_enable: false
          pulls: ['61.55.189.141:1935', '61.55.189.142:1935', '61.55.189.143:1935',
            '61.55.189.144:1935', '61.55.189.145:1935', '61.55.189.146:1935', '61.55.189.147:1935',
            '61.55.189.148:1935', '61.55.189.149:1935', '61.55.189.150:1935', '61.55.189.151:1935',
            '61.55.189.152:1935', '61.55.189.153:1935', '61.55.189.154:1935', '61.55.189.155:1935',
            '61.55.189.156:1935', '61.55.189.157:1935', '61.55.189.170:1935', '61.55.189.173:1935',
            '103.38.42.69:1935', '103.38.42.70:1935', '103.38.42.71:1935', '103.38.42.72:1935',
            '103.38.42.73:1935', '103.38.42.74:1935', '103.38.42.76:1935', '103.38.42.78:1935',
            '103.38.42.79:1935', '103.38.42.80:1935', '103.38.42.81:1935', '122.226.181.106:1935',
            '122.226.181.114:1935', '122.226.181.115:1935', '122.226.181.116:1935',
            '122.226.181.117:1935', '122.226.181.118:1935', '122.226.181.119:1935',
            '122.226.181.226:1935', '122.226.181.227:1935', '122.226.181.228:1935',
            '122.226.181.229:1935', '122.226.181.230:1935', '122.226.181.25:1935',
            '122.226.181.26:1935', '122.226.181.27:1935', '122.226.181.28:1935', '122.226.181.29:1935',
            '122.226.181.60:1935', '122.226.181.61:1935', '183.57.151.101:1935', '183.57.151.103:1935',
            '183.57.151.104:1935', '183.57.151.116:1935', '183.57.151.121:1935', '183.57.151.127:1935',
            '183.57.151.128:1935', '183.57.151.129:1935', '183.57.151.131:1935', '183.57.151.135:1935',
            '183.57.151.187:1935']
          push_when_need: {enable: false}
          record_enable: false
  role: 1F
