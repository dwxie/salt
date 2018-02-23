relay:
  role: '1F'
  config:
    connection_config:
      stream_event_notify_type: 2
    h264_save_config:
      storage_enable: 0
    center_server_config:
      server_ip: 'shty-api.antelopecloud.cn'
      server_port: 80
      app_id: 'twem'
      app_key: 'zoc19i5j32p5mq9olb46zs2115m85m16'
    circle_storage_config:
      disk_schedule_server_ip: '192.168.1.84'
      record_days:
        - 7
    object_server_config:
      object_server_list: []
    event_storage_config:
      support_event_alarm_command: 1
      area_id: 1
    tracker_serverlist_config:
      -
        server_ip: '101.89.178.44'
        server_port: 80
    mq_server_list_config:
      -
        server_ip: 'rabbitmq.private'
        server_port: 5672
        vhost: '/topvdn'
        user_name: 'topvdn'
        password: 'UK2at138w7rB4ob9nYaO'
        ex_changeName: 'event_storage'
        route_key: 'event_storage_1'
        queue_name: 'event_storage_1_q'
      -
        server_ip: 'rabbitmq.private'
        server_port: 5672
        vhost: '/topvdn'
        user_name: 'topvdn'
        password: 'UK2at138w7rB4ob9nYaO'
        ex_changeName: 'event_storage'
        route_key: 'event_info_1'
        queue_name: 'event_info_1_q'
      -
        server_ip: 'rabbitmq.private'
        server_port: 5672
        vhost: '/topvdn'
        user_name: 'topvdn'
        password: 'UK2at138w7rB4ob9nYaO'
        ex_changeName: 'relay_push_state'
        route_key: 'relay_push_state'
        queue_name: 'relay_push_state_q'
