elastic:
  elasticsearch:
    version: '5.3.0'
    user: 'elasticsearch'
    group: 'elasticsearch'
    elasticsearch:
      cluster:
        name: 'ly_log_cluster'
      path:
        repo:
          - '/opt/es_backup'
      bootstrap:
        mlockall: 'true'
        memory_lock: 'true'
      http:
        port: 9200
        max_initial_line_length: '1mb'
      discovery:
        zen:
          ping:
            unicast:
              hosts:
                - '192.168.2.210'
                - '192.168.2.214'
                - '192.168.2.218'
            timeout: 5s
          minimum_master_nodes: 1
      index:
        number_of_shards: 6
        mapper:
          dynamic: 'true'
        translog:
          durability: 'async'
        refresh:
          interval: '10s'
        merge:
          scheduler:
            max_thread_count: 1
          policy:
            floor_segment: '10MB'
        fielddata:
          cache:
            size: '20%'
      indices:
        store:
          throttle:
            max_bytes_per_sec: '2MB'
