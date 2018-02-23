tracker:
  config:
    tracker:
      udp_listen:
        listen_ip: '0.0.0.0'
        listen_port:
          - 53
          - 80
          - 443
          - 8000
      tcp_listen:
        switch: 0
        listen_ip: '0.0.0.0'
        listen_port:
          - 443
        max_connection: 262144
      tracker_ip: '127.0.0.1'
      tracker_port: 80
      relay_whitelist_switch: 0
      peer_heartbeat_interval: 10
      relay_heartbeat_interval: 5
      recv_packet_queue_length: 4096
      send_packet_queue_length: 4096
      max_peer_count: 2048
      max_relay_count: 256
      rabbitmq_status_report:
        url:
          - 'amqp://user:pass@127.0.0.1:5672'
        vhost: '/vhost'
        exchange: 'device_state'
      rabbitmq_message:
        url:
          - 'amqp://user:pass@127.0.0.1:5672'
        vhost: '/vhost'
        exchange: 'tracker_msg'
        routing_key: 'tracker_127.0.0.1'
        queue_name: 'tracker_127.0.0.1_q'
      http_center_web:
        host: 'http://jxsr-api.antelopecloud.cn'
        local_ip: '127.0.0.1'
        appid: 'qpen'
        appkey: '8187209bbf5f6cc6d39824f024309ff3'
      kafka_event_metadata:
        switch: 0
        topic: 'eventinfo'
        broker:
          - '127.0.0.1:9092'
      ip_global_info_path: 'config/ip_detail_info.db'
      log_config_path: 'config/logging.conf'
      relay_group_config_path: 'config/relay_group.json'
      cid_bond_relay_config_path: 'config/cid_bond_relay.json'
      selection_strategy_config_path: 'config/selection_strategy.json'
      white_list_config_path: 'config/white_list.json'
      relay_extra_info_config_path: 'config/relay_extra_info.json'
      statistic_http_listen:
        listen_ip: '127.0.0.1'
        port: 9527
