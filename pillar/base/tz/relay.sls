relay:
  role: '1F'
  config:
    connection_config:
      stream_event_notify_type: 2
    h264_save_config:
      mongo_url: 'mongodb://camera:ZumHPRN8WCJkCDFU6Kuvpub9@192.168.2.207:27117,192.168.2.208:27117,192.168.2.209:27117/?authSource=camera'
    center_server_config:
      server_ip: 'api.topvdn.com'
      server_port: 80
      app_id: 'RBWz'
      app_key: 'HXsC73MavG7caTC4b2DPECw68Cjc8vUz'
    circle_storage_config:
      disk_schedule_server_ip: '192.168.2.205'
      record_days:
        - 7
        - 30
    event_storage_config:
      support_event_alarm_command: 1
      area_id: 3
      object_server_list: []
    mq_server_list_config:
      -
        server_ip: '192.168.2.204'
        server_port: 5672
        vhost: '/tracker_app'
        user_name: 'tracker_app'
        password: 'Megaium!'
        ex_changeName: 'event_storage'
        route_key: 'event_storage_3'
        queue_name: 'event_storage_3_q'
      -
        server_ip: '192.168.2.204'
        server_port: 5672
        vhost: '/tracker_app'
        user_name: 'tracker_app'
        password: 'Megaium!'
        ex_changeName: 'event_storage'
        route_key: 'event_info_3'
        queue_name: 'event_info_3_q'
      -
        server_ip: '192.168.2.204'
        server_port: 5672
        vhost: '/tracker_app'
        user_name: 'tracker_app'
        password: 'Megaium!'
        ex_changeName: 'relay_push_state'
        route_key: 'relay_push_state'
        queue_name: 'relay_push_state_q'
