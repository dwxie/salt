smpagent:
  plugins:
    collector:
      pluginCollector:
        config:
          'on': true
          name: Collector
          load_type: go
          path: plugins/collector/bin/pluginCollector.so
          config_path: plugins/etc/collector.yaml
          schedule:
            type: durable
            interval: 0
            filters: MongoSender.Save
      collector:
        config:
          tasks:
            -
              type: service_sys
              collector: cmd
              args: 'python /opt/smpagent/scrpits/get_info/get_info.py'
              cron: '1 * * * * *'
