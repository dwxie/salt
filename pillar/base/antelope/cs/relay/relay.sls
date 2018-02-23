relay:
  role: '1F'
  nginx:
    events:
      worker_connections: 4096
    rtmp:
      server:
        listen:
          - 1935
        access_log: 'logs/rtmp_access.log'
        live:
          live: 'on'
          drop_idle_publisher: '15s'
          idle_streams: 'off'
          wait_video: 'on'
          push_when_need:
            enable: False
            heartbeat_time: 5
          hls_enable: False
          hls: 'on'
          hls_path: '/tmp/hls'
          hls_nested: 'on'
          hls_fragment: '2s'
          hls_playlist_length: '7s'
          record_enable: False
          record: 'all'
          slice_enable: False
          slice: 'on'
          slice_path: '/tmp/slice'
          pulls: []
    http:
      sendfile: 'on'
      keepalive_timeout: 65
      log_format:
        name: main
      access_log: 'logs/access.log'
      access_log_format_name: 'main'
      server:
        listen:
          - 80
          - 8080
        server_name: 'localhost'
        hls:
          check_token: 'off'
        live:
          check_token: 'off'
        snapshot_enable: True
        info_enable: True
  config:
    connection_config:
      close_source_flag: 0
      max_upload_bandwidth: 1000
      max_download_connections: 1000
      max_download_bandwidth: 1000
      peer_id: 534904833
      relay_name: {{ grains['host'] }}
      zone_id: 1
      node_id: 1
      index_server_port: 8230
      relay_type: 0
      rtmp_play_check_flag: 1
      rtmp_public_mode_flag: 0
      time_shift_flag: 0
      audio_pass_back: 0
      data_storage_path: '/tmp/path/'
      vod_url: 'http://vod2.public.topvdn.cn/3/'
      live_url: 'rtmp8.public.topvdn.cn'
      local_proxy_url: 'http://127.0.0.1:3000/api/live_event/'
      stream_event_notify_type: 0
      live_notify_mq_server_list:
        - 3
    h264_save_config:
      enable: 1
      live_enable: 1
      storage_enable: 1
      check_flag: 0
      interval: 10
      mongo_url: 'mongodb://user:pass@127.0.0.1:27117/?authSource=camera'
    center_server_config:
      server_ip: '127.0.0.1'
      server_port: 80
      app_id: 'HAAt'
      app_key: 'bPsuiEDoNSfAoIoxp8vrytYIjBcYbl7q'
    circle_storage_config:
      enable: 0
      record_statistics_flag: 0
      disk_schedule_server_ip: '127.0.0.1'
      disk_schedule_server_port: 5730
      record_days:
        - 7
    object_server_config:
      object_server_list: []
    event_storage_config:
      type: 0
      support_event_alarm_command: 0
      area_id: 99
      ceph_pool_name: 'event_storage'
      hls_metadata_mq_server_list:
        - 1
      alarm_mq_server_list:
        - 2
    relay_config:
      target: []
    tracker_serverlist_config:
      -
        server_ip: '223.202.103.130'
        server_port: 80
      -
        server_ip: '183.57.151.206'
        server_port: 80
      -
        server_ip: '122.226.181.30'
        server_port: 80
      -
        server_ip: '61.55.189.131'
        server_port: 80
      -
        server_ip: '103.38.42.91'
        server_port: 80
      -
        server_ip: '42.51.7.44'
        server_port: 80
    mq_server_list_config:
      -
        server_ip: '127.0.0.1'
        server_port: 5672
        vhost: '/tracker_app'
        user_name: 'tracker_app'
        password: 'Megaium!'
        ex_changeName: 'event_storage'
        route_key: 'event_storage_99'
        queue_name: 'event_storage_99_q'
      -
        server_ip: '127.0.0.1'
        server_port: 5672
        vhost: '/tracker_app'
        user_name: 'tracker_app'
        password: 'Megaium!'
        ex_changeName: 'event_storage'
        route_key: 'event_info_99'
        queue_name: 'event_info_99_q'
      -
        server_ip: '127.0.0.1'
        server_port: 5672
        vhost: '/tracker_app'
        user_name: 'tracker_app'
        password: 'Megaium!'
        ex_changeName: 'relay_push_state'
        route_key: 'relay_push_state'
        queue_name: 'relay_push_state_q'
