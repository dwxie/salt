relay:
  role: 'C0'
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
          hls_fragment: '3s'
          hls_playlist_length: '10s'
          record_enable: False
          record: 'all'
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
      max_upload_bandwidth: 1000
      max_download_connections: 1000
      max_download_bandwidth: 1000
      peer_id: 534970368
      relay_type: 192
      rtmp_play_check_flag: 1
      time_shift_flag: 0
      audio_pass_back: 1
      data_storage_path: '/tmp/path/'
      vod_url: 'http://vod2.public.topvdn.cn/3/'
      live_url: 'rtmp8.public.topvdn.cn'
      local_proxy_url: 'http://127.0.0.1:3000/api/live_event/'
      stream_event_notify_type: 2
      live_notify_mq_server_list:
        - 3
    h264_save_config:
      enable: 1
      live_enable: 1
      storage_enable: 1
      check_flag: 0
      interval: 10
      mongo_url: 'mongodb://camera:Megaium!@172.31.15.49:27117/?authSource=camera'
    center_server_config:
      server_ip: 'api.topvdn.com'
      server_port: 80
      app_id: 'RBWz'
      app_key: 'HXsC73MavG7caTC4b2DPECw68Cjc8vUz'
    circle_storage_config:
      enable: 0
      disk_schedule_server_ip: '172.31.15.49'
      disk_schedule_server_port: 5730
      record_days:
        - 7
        - 30
    event_storage_config:
      type: 0
      support_event_alarm_command: 1
      ceph_pool_name: 'event_storage'
      hls_metadata_mq_server_list:
        - 1
      alarm_mq_server_list:
        - 2
    relay_config:
      target: []
    tracker_serverlist_config:
    mq_server_list_config:
      -
        server_ip: '172.31.15.49'
        server_port: 5672
        vhost: '/tracker_app'
        user_name: 'tracker_app'
        password: 'Megaium!'
        ex_changeName: 'event_storage'
        route_key: 'event_storage_3'
        queue_name: 'event_storage_3_q'
      -
        server_ip: '172.31.15.49'
        server_port: 5672
        vhost: '/tracker_app'
        user_name: 'tracker_app'
        password: 'Megaium!'
        ex_changeName: 'event_storage'
        route_key: 'event_info_3'
        queue_name: 'event_info_3_q'
      -
        server_ip: '172.31.15.49'
        server_port: 5672
        vhost: '/tracker_app'
        user_name: 'tracker_app'
        password: 'Megaium!'
        ex_changeName: 'relay_push_state'
        route_key: 'relay_push_state'
        queue_name: 'relay_push_state_q'

  CenterServerConfig:
    ServerIp: 'api.topvdn.com'
    ServerPort: 80
    AppID: 'RBWz'
    AppKey: 'HXsC73MavG7caTC4b2DPECw68Cjc8vUz'

  ConnectionConfig:
    ConnectionConfig:
      RtmpPort: 1935
      LocalProxyUrl: 'http://127.0.0.1:3000/api/live_event/'
    H264SavaConfig:
      MemoryPath: '/ram_data'
      H264SavaInterval: 10
    StorageConfig:
      SupportCircleStorage: 1
      EventStorageType: 0
      SupportEventCommand: 0

  disk_schedule:
    disk_schedule_server_ip: '172.31.15.49'
    disk_schedule_server_port: 5730
    record_days:
      - 7

  MQServerConfig:
    MetaMQServerInfo:
      ServerIP: '172.31.15.49'
      ServerPort: 5672
      Vhost: '/tracker_app'
      UserName: 'tracker_app'
      PassWord: 'Megaium!'
      ExchangeName: 'event_storage'
      RouteKey: 'event_storage_3'
      QueueName: 'event_storage_3_q'
      CephPoolName: 'event_storage'
      AreaId: 3
    AlarmMQServerInfo:
      ServerIP: '172.31.15.49'
      ServerPort: 5672
      Vhost: '/tracker_app'
      UserName: 'tracker_app'
      PassWord: 'Megaium!'
      ExchangeName: 'event_storage'
      RouteKey: 'event_info_3'
      QueueName: 'event_info_3_q'
    LiveNotifyMQServerInfo:
      ServerIP: '172.31.15.49'
      ServerPort: 5672
      Vhost: '/tracker_app'
      UserName: 'tracker_app'
      PassWord: 'Megaium!'
      ExchangeName: 'relay_push_state'
      RouteKey: 'relay_push_state'
      QueueName: 'relay_push_state_q'
