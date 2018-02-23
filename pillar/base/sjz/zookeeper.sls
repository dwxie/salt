apache:
  zookeeper:
    config:
      zoo:
        tickTime: 2000
        dataDir: '/data/zookeeper'
        clientPort: 2181
        initLimit: 10
        syncLimit: 5
        connect_timeout: 6000
        session_timeout: 6000
        servers:
          -
            host: '5.zookeeper.private'
            rpc_port: 2888
            election_port: 3888
          -
            host: '6.zookeeper.private'
            rpc_port: 2888
            election_port: 3888
          -
            host: '7.zookeeper.private'
            rpc_port: 2888
            election_port: 3888
