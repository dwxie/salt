elastic:
  cerebro:
    config:
      supervisor:
        cerebro:
          http:
            address: '127.0.0.1'
            port: 9001
      application:
        secret: "}0(05F$/5?'5/%x1i8683X0(4pl1Mc!}5fJ6g9)`60'7OaJ.,3,%@6G|1HW2[}iG"
        basePath: '/'
        rest:
          history:
              size: 200
        hosts:
          -
            host: 'http://192.168.2.210:9200'
            name: 'ly_log_cluster'
        auth:
          type: 'basic'
          settings:
            username: 'topvdn'
            password: 'CK4J9of1QqMwu42JUn'
      reference:
        play:
          crypto:
            secret: "}0(05F$/5?'5/%x1i8683X0(4pl1Mc!}5fJ6g9)`60'7OaJ.,3,%@6G|1HW2[}iG"
        basePath: '/'
        data:
          path: './cerebro.db'
      routes:
