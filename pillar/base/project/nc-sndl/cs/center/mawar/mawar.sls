platweb:
  mawar:
    mawar:
      config:
        core:
          bind: ':9699'
          token_key: '417bee3e5ee03f7e97224487cbe3d564'
          user_agent: 'antelope-mawar'
          storage: '3'
          token_confs:
            -
              storage: 3
              control: 3223060480
            -
              storage: 0
              control: 65280
          #ezviz_token_duration: 300
        database:
          mongo_dbname: 'mawar'
          mongo_url: 'mongodb://mawar:GCW0l90V7p8Bo9Lc3X2C2WzJE@1.mongodb.private:27017,2.mongodb.private:27017,3.mongodb.private:27017/mawar?authSource=mawar'
        antelope:
          host: 'http://jxsr-api.antelopecloud.cn'
          lyid: 'sumf'
          lykey: '5b3a49ce860d357d9be89d282d64dba9'
          update_app_interval: 60
          update_app_url: 'http://jxsr-api.antelopecloud.cn/API/apps/keys?since=%v'
          push_url_fmt: 'topvdn://0.0.0.0:0?protocolType=2&connectType=1&token=%v&mode=3'
          video_url_fmt: "topvdn://public.topvdn.cn?cid=%v&protocolType=3&token=%v"
        iermu:
          host: 'https://api.iermu.com'
          api_key: 'XhinwsgmqgaJt0X1uyno'
          client_uid: 265310
          secret_key: 'KAJCyOl0AnfV9b9jpqWSvsjfCRKlBDSYf9Q9yuWr'
        project:
          data_path: '/var/www/projects.json'
        ezviz:
            app_id: 'odko'
            init_string: "[Config]\r\nIsDebug=0\r\nLocalBasePort=8200\r\nIsCaptureDev=1\r\nIsPlayDev=1\r\nUdpSendInterval=2\r\n[Tracker]\r\nCount=3\r\nIP1=218.95.36.34\r\nPort1=80\r\nIP2=218.95.36.43\r\nPort2=8000\r\nIP3=218.95.36.13\r\nPort3=443\r\n[LogServer]\r\nCount=1\r\nIP1=42.51.12.137\r\nPort1=80\r\n"
            host: "https://open.ys7.com"
            app_key: "951da737abd34077af7ab06efd3523e6"
            secret: "8c9fd73cfdd891f3c8bdf33ef12841e3"
        event_transport:
            host: "https://jxsr-oss1.antelopecloud.cn"
            area_id: 1
            channel_id: 0
            expire_type: 1
            size_limit: 2097152
