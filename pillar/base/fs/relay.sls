relay:
  role: '1F'
  config:
    connection_config:
      stream_event_notify_type: 2
    h264_save_config:
      mongo_url: 'mongodb://camera:ZumHPRN8WCJkCDFU6Kuvpub9@192.168.2.211:27117,192.168.2.212:27117,192.168.2.237:27117/?authSource=camera'
    center_server_config:
      server_ip: 'api.topvdn.com'
      server_port: 80
      app_id: 'RBWz'
      app_key: 'HXsC73MavG7caTC4b2DPECw68Cjc8vUz'
    circle_storage_config:
      disk_schedule_server_ip: '192.168.2.213'
      record_days:
        - 7
        - 30
    object_server_config:
      object_server_list:
        -
          server_ip: '192.168.2.216'
          server_port: 8088
        -
          server_ip: '192.168.2.217'
          server_port: 8088
        -
          server_ip: '192.168.2.218'
          server_port: 8088
    event_storage_config:
      support_event_alarm_command: 1
      area_id: 1
    mq_server_list_config:
      -
        server_ip: '192.168.2.213'
        server_port: 5672
        vhost: '/tracker_app'
        user_name: 'tracker_app'
        password: 'Megaium!'
        ex_changeName: 'event_storage'
        route_key: 'event_storage_1'
        queue_name: 'event_storage_1_q'
      -
        server_ip: '192.168.2.213'
        server_port: 5672
        vhost: '/tracker_app'
        user_name: 'tracker_app'
        password: 'Megaium!'
        ex_changeName: 'event_storage'
        route_key: 'event_info_1'
        queue_name: 'event_info_1_q'
      -
        server_ip: '192.168.2.213'
        server_port: 5672
        vhost: '/tracker_app'
        user_name: 'tracker_app'
        password: 'Megaium!'
        ex_changeName: 'relay_push_state'
        route_key: 'relay_push_state'
        queue_name: 'relay_push_state_q'
