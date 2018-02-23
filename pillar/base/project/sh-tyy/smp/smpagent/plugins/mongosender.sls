smpagent:
  plugins:
    mongosender:
      pluginMongoSender:
        config:
          'on': true
          name: MongoSender
          load_type: go
          path: plugins/mongosender/bin/pluginMongoSender.so
          config_path: plugins/etc/mongosender.yaml
          schedule:
            type: filter
            interval: 0
            filters:
      mongosender:
        config:
          mongo:
            uri: 'mongodb://eye:LzjXsPA4173PA59Xc61697Sjy@1.mongodb.private:27017/eye?authSource=eye'
            dbname: 'eye'
          message_buffer_size: 30
          producer_worker_num: 5
