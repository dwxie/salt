elastic:
  cerebro:
    config:
      supervisor:
        cerebro:
          http:
            address: '127.0.0.1'
            port: 9001
      application:
        secret: "jQ3%Gm9Cb4G%4@P@r!L@b@cdrlvD#N7mNDwSgHVtM3#VtqiLe6KcbBF5HXGeh5sh"
        basePath: '/'
        rest:
          history:
              size: 200
        hosts:
          -
            host: 'http://127.0.0.1:9200'
            name: 'ly_log_cluster'
        auth:
          type: 'basic'
          settings:
            username: 'cerebro'
            password: 'A89oD9zDx9859VLxGE'
      reference:
        play:
          crypto:
            secret: "jQ3%Gm9Cb4G%4@P@r!L@b@cdrlvD#N7mNDwSgHVtM3#VtqiLe6KcbBF5HXGeh5sh"
        basePath: '/'
        data:
          path: './cerebro.db'
      routes:
