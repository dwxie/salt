keeper:
  config:
    core:
      bind: ':7788'
      host: 'https://jxsr-keeper.antelopecloud.cn'
      user_agent: 'lingtong-house-keeper'
      token_key: 'nn+TtGySuTIANPeFb43tpQ=='
      token_expired_s: 604800
      test_data_file: /var/www/keeper_cigs_data.json
    database:
      mongo_dbname: 'keeper'
      mongo_url: 'mongodb://keeper:xPw2L8Wm1H7HpRn692i5fZX6B@1.mongodb.private:27017,2.mongodb.private:27017,3.mongodb.private:27017/keeper?authSource=keeper'
    antelope:
      lyid: 'odko'
      lykey: '90fb7d4d094b883ac64413d802f61359'
      host: 'https://jxsr-api.antelopecloud.cn'
      lyadfs_host: 'https://jxsr-oss1.antelopecloud.cn'
      hls_video_url: 'https://jxsr-api.antelopecloud.cn/v2/record/%v/storage/hls/%v_%v.m3u8?client_token=%v'
      hls_video_timeline_url: 'https://jxsr-api.antelopecloud.cn/v2/record/%v/storage/hls?start=%v&end=%v&client_token=%v'
      oss_image_url: 'http://jxsr-oss1.antelopecloud.cn/fileinfo/page_query?total_num=1000&page_num=%v&page_count=%v&access_token=1003775_3145728_1577429797_abf24269c1b163a04a4090643a82f411'
    captcha:
      length: 4
      width: 184
      hegith: 56
      expire: 300
      mail_captcha_tmpl_file: './template/mailcaptcha.html'
    mail:
      server: 'smtp.mxhichina.com'
      port: 25
      user: 'privatecloud1@antelope.cloud'
      password: 'Megaium!'
    gbadmin:
        host: "http://218.95.36.34:8096"
        client_id: "5a584b24ac72cb1654368d43"
        client_secret: "91a2109133a602c3a4e66b7c4568481f"
    amap:
        host: "http://restapi.amap.com"
        key: "1864c66ec09a05cb0bb1be0e994e01c7"
