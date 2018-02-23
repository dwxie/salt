cos:
  automaticTool:
    config:
      general:
        server_url: 'http://192.168.2.31:8088'
        user_token: '1003775_3145728_1577429797_abf24269c1b163a04a4090643a82f411'
        user_operate_frequency: 100
        mode: 'upload'
      log:
        level: 'INFO'
        path: './logs'
        filename: 'automaticTool.2006.01.02.log'
      upload:
        test_mode: 2
        upload_path: ./data_upload
        key_flag: 1
        key_ID: /root/test/1.txt
        metadata: join@antelope.cloud
        upload_user_count: 1
        upload_times: 1
        upload_way: 2
        upload_file_type: 1
        upload_file_size_min: 204800
        upload_file_size_max: 204800
        upload_file_count: 1
        upload_expire_type: 1
        upload_file_frequency: 1
        stastic_edge: 100
      download:
        test_mode: 2
        download_path: ./data_download
        download_way: 1
        download_check: 0
        download_list:
          - 5910181d000f50ff0100dffd
        download_db_url: 'adfs:A26JQ34PTFWqxZ9PqV5EFB0iu@5.cs.mongodb.dynamic:27417,6.cs.mongodb.dynamic:27417,7.cs.mongodb.dynamic:27417/?authSource=adfs&replicaSet=co_adfs'
        download_times: 1
        download_user_count: 1
        download_file_frequency: 1
      query:
        thread_count: 1
        query_way: 2
        query_db_url: 'topvdn:qjPLZ5H4y7MDFSW6vfxoU2gha@5.cs.mongodb.dynamic:27517,6.cs.mongodb.dynamic:27517,7.cs.mongodb.dynamic:27517/?authSource=topvdn&replicaSet=co_disktracker'
        query_list:
          - 5910181d000f50ff0100dffd
      delete:
        thread_count: 1
        delete_way: 2
        delete_db_url: 'topvdn:qjPLZ5H4y7MDFSW6vfxoU2gha@5.cs.mongodb.dynamic:27517,6.cs.mongodb.dynamic:27517,7.cs.mongodb.dynamic:27517/?authSource=topvdn&replicaSet=co_disktracker'
        delete_list:
          - 5910181d000f50ff0100dffd
