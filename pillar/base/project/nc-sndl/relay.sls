relay:
  role: '1F'
  config:
    connection_config:
      stream_event_notify_type: 2
    h264_save_config:
      storage_enable: 0
    center_server_config:
      server_ip: 'jxsr-api.antelopecloud.cn'
      server_port: 80
      app_id: 'kooo'
      app_key: 'aadbb26e307776fbfb5c9c8fbb2c4986'
    circle_storage_config:
      disk_schedule_server_ip: '192.168.2.43'
      record_days:
        - 7
    event_storage_config:
      support_event_alarm_command: 1
      area_id: 1
      object_server_list: []
    tracker_serverlist_config:
      -
        server_ip: '218.95.36.34'
        server_port: 80
      -
        server_ip: '218.95.36.43'
        server_port: 80
      -
        server_ip: '218.95.36.13'
        server_port: 80
    mq_server_list_config:
      -
        server_ip: '192.168.2.34'
        server_port: 5672
        vhost: '/topvdn'
        user_name: 'topvdn'
        password: 'W1rvtlViBO3RLwklImKO'
        ex_changeName: 'event_storage'
        route_key: 'event_storage_1'
        queue_name: 'event_storage_1_q'
      -
        server_ip: '192.168.2.43'
        server_port: 5672
        vhost: '/topvdn'
        user_name: 'topvdn'
        password: 'W1rvtlViBO3RLwklImKO'
        ex_changeName: 'event_storage'
        route_key: 'event_info_1'
        queue_name: 'event_info_1_q'
      -
        server_ip: '192.168.2.13'
        server_port: 5672
        vhost: '/topvdn'
        user_name: 'topvdn'
        password: 'W1rvtlViBO3RLwklImKO'
        ex_changeName: 'relay_push_state'
        route_key: 'relay_push_state'
        queue_name: 'relay_push_state_q'
