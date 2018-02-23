zookeeper:
  config:
    tickTime: '2000'
    datadir: '/kafka_data/zookeeper/log'
    port: '2181'
    initlimit: '10'
    synclimit: '5'
    connect_timeout: '6000'
    session_timeout: '6000'
    zoo_host1: '192.168.2.52'
    zoo_host2: '192.168.2.53'
    zoo_host3: '192.168.2.54'
