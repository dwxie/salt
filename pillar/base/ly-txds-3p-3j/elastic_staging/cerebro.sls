elastic:
  cerebro:
    config:
      supervisor:
        cerebro:
          http:
            address: '127.0.0.1'
            port: 9001
      application:
        secret: "6pFn412A3749Ri577V4jSRI43f55QG&2y099Og3ZcWC9nHRDA90BEwI~4uP038tn"
        basePath: '/'
        rest:
          history:
              size: 200
        hosts:
          -
            host: 'http://192.168.2.227:9200'
            name: 'ly_log_cluster'
        auth:
          type: 'basic'
          settings:
            username: 'topvdn'
            password: 'NUWB37W6fHpWLCBfzC'
      reference:
        play:
          crypto:
            secret: "6pFn412A3749Ri577V4jSRI43f55QG&2y099Og3ZcWC9nHRDA90BEwI~4uP038tn"
        basePath: '/'
        data:
          path: './cerebro.db'
      routes:
