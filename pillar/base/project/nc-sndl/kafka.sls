#kafka pillar
kafka:
  config:
    broker:
      network_threads: '3'
      IO_type: 'async'
      IO_threads: '8'
      partitions: '16'
      data_thread: '1'
      host1: '192.168.2.52'
      host2: '192.168.2.53'
      host3: '192.168.2.53'
      default_replication_nums: '3'
    log:
      dirs: '/kafka_data/data'
      cleanup_policy: 'delete'
      retention_hours: '168'
      segment: '1073741824'
      check_ms: '30000'
    socket:
      send_buffer: '102400'
      receive_buffer: '102400'
      max_byte: '104857600'
