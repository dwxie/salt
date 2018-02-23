smpagent:
  smpagent:
    config:
      schedule:
        api_bind: '127.0.0.1:8098'
        plugins:
          - '/opt/smpagent/plugins/collector/pluginCollector.yaml'
          - '/opt/smpagent/plugins/mongosender/pluginMongoSender.yaml'
        log:
          level: 'debug'
          dir: 'logs/'
        debug:
          bind: '127.0.0.1:8097'
          perf_enable: true
