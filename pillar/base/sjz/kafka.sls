apache:
  kafka:
    config:
      server:
        advertised:
          listeners: 'PLAINTEXT://127.0.0.1:9092'
        listeners: 'PLAINTEXT://127.0.0.1:9092'
        broker:
          list:
            - '5.kafka.private:9092'
            - '6.kafka.private:9092'
            - '7.kafka.private:9092'
          default_replication_nums: 3
        default:
          replication:
            factor: 3
        delete:
          topic:
            enable: true
        auto:
          leader:
            rebalance:
              enable: true
          create:
            topics:
              enable: true
        num:
          network:
            threads: 3
          io:
            threads: 8
          partitions: 6
          recovery:
            threads:
              per:
                data:
                  dir: 1
        producer:
          type: 'async'
        log:
          cleanup:
            policy: 'delete'
          dirs: '/data/kafka'
          retention:
            hours: 168
            check:
              interval:
                ms: 30000
          segment:
            bytes: 1073741824
        socket:
          send:
            buffer:
              bytes: 102400
          receive:
            buffer:
              bytes: 102400
          request:
            max:
              bytes: 104857600
        zookeeper:
          connect:
            - '5.zookeeper.private:2181'
            - '6.zookeeper.private:2181'
            - '7.zookeeper.private:2181'
          connection:
            timeout:
              ms: 6000
          session:
            timeout:
              ms: 6000
      producer:
        bootstrap:
          servers:
            - '5.kafka.private:9092'
            - '6.kafka.private:9092'
            - '7.kafka.private:9092'
      consumer:
        zookeeper:
          connect:
            - '5.zookeeper.private:2181'
            - '6.zookeeper.private:2181'
            - '7.zookeeper.private:2181'
          connection:
            timeout:
              ms: 6000
        consumer:
          timeout:
            ms: 5000
