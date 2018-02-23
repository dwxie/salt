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
            uri: 'mongodb://eye:V41a7574l8fgTF5S7010IHppZ@1.mongodb.private:27017,2.mongodb.private:27017,3.mongodb.private:27017/eye?authSource=eye'
            dbname: 'eye'
          message_buffer_size: 30
          producer_worker_num: 5
