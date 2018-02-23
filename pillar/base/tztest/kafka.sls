#kafka pillar
kafka:
  config:
    broker:
      network_threads: '3'
      IO_type: 'async'
      IO_threads: '8'
      partitions: '16'
      data_thread: '1'
      host1: '192.168.2.232'
      host2: '192.168.2.233'
      host3: '192.168.2.234'
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
zookeeper:
  config:
    tickTime: '2000'
    datadir: '/kafka_data/zookeeper/log'
    port: '2181'
    initlimit: '10'
    synclimit: '5'
    connect_timeout: '6000'
    session_timeout: '6000'
    zoo_host1: '192.168.2.232'
    zoo_host2: '192.168.2.233'
    zoo_host3: '192.168.2.234'
    
