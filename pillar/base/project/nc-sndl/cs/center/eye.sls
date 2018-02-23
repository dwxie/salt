platweb:
  eye:
    eye:
      config:
        server:
          bind: ':8099'
          host: 'https://jxsr-console.antelopecloud.cn'
        mongo:
          url: 'mongodb://eye:V41a7574l8fgTF5S7010IHppZ@1.mongodb.private:27017,2.mongodb.private:27017,3.mongodb.private:27017/eye?authSource=eye'
          database: 'eye'
        center_mongo:
            url: 'mongodb://camera:r3aK291srKSjGihelYzoeY2Q@1.mongodb.private:27017,2.mongodb.private:27017,3.mongodb.private:27017/camera?authSource=camera'
            database: 'camera'
        center:
            lyid: 'sumf'
            lykey: '5b3a49ce860d357d9be89d282d64dba9'
            app_syn_url: 'http://jxsr-api.antelopecloud.cn/API/apps/keys?since=%v'
            app_syn_interval: 300
            video_m3u8_url: 'http://jxsr-api.antelopecloud.cn/v2/record/%v/storage/hls/%v_%v.m3u8?client_token=%v'
            video_list_url: 'http://jxsr-api.antelopecloud.cn/v2/record/%v/storage/hls?start=%v&end=%v&client_token=%v'
            live_url: 'http://%v/live/%v/index.m3u8?client_token=%v'
        keys:
          token: '417bee3e5ee03f7e97224487cbe3d564'
        mail:
          server: 'smtp.mxhichina.com'
          port: 465
          user: 'sysmail@topvdn.com'
          password: 'Megaium!'
        sys_alert:
          - threshold: [0.75, 0.6]
            field: 'cpu_rate'
            description: 'CPU使用率过高，请查看'
          - threshold: [0.9, 0.75]
            field: 'memory_rate'
            description: '内存使用量过高，请查看'
          - threshold: [104857600, 52428800]
            field: 'io_read'
            description: '磁盘IO数据读取持续高于警戒值，请关注'
          - threshold: [104857600, 52428800]
            field: 'io_write'
            description: '磁盘IO数据写入持续高于警戒值，请关注'
          - threshold: [314572800, 104857600]
            field: 'net_in'
            description: '进入主机网络流量持续高于警戒值，请关注'
          - threshold: [314572800, 104857600]
            field: 'net_out'
            description: '流出主机网络流量持续高于警戒值，请关注'
          #- threshold: [0.9, 0.75]
          #  field: 'disc_used'
          #  description: '磁盘使用率持续高于警戒值，请关注'
        alert_cron: '0 */1 * * * *'
