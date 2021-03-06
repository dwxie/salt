# mysql pillars
mysql:
  config:
    base:
      port: '3306'
      socket: '/usr/local/services/mysql/var/data/mysql.sock'
      bind_ip: '0.0.0.0'
      pid_file: '/usr/local/services/mysql/var/data/mysql.pid'
      char_set: 'utf8'
      basedir: '/usr/local/services/mysql'
      datadir: '/usr/local/services/mysql/var/data'
      max_connection: '10000'
      max_user_connection: '10000'
      max_connect_errors: '10000'
      wait_timeout: '28800'
      interactive_timeout: '28800'
      table_open_cache: '512'
      max_allowed_packet: '32M'
      sort_buffer_size: '2M'
      join_buffer_size: '2M'
      thread_cache_size: '8'
      thread_concurrency: '32'
      query_cache_size: ''
      default_storage_engine: 'Innodb'
      server_id: '1'
      read_buffer: '2M'
      write_buffer: '2M'
      log_error_pos: '/usr/local/services/mysql/var/logs/mysqld.log'
      long_query_time: '2'
      slow_query_log_file: '/usr/local/services/mysql/var/logs/mysql-slow.log'
      binlog_pos: '/usr/local/services/mysql/var/binlog/mysql-bin'
      binlog_ignore_db: 'mysql,information_schema,performanc_schema'
      sync_binlog: '100'
      binlog_format: 'MIXED'
      expire_logs_days: '3'
      replication_ignore_db: 'information_schema,performance_schema,mysql'
      replication_wild_ignore_table: 'mysql.%'
      relay_log_info_file: '/usr/local/services/mysql/var/relaylog/relay-log.info'
      relay_log: '/usr/local/services/mysql/var/relaylog/mysql-relay-bin'
      relay_log_index: '/usr/local/services/mysql/var/relaylog/mysql-relay-bin'
    innodb:
      redodir: '/usr/local/services/mysql/var/redolog'
      innodb_additional_mem_pool_size: '10M'
      innodb_buffer_pool_size: {{ grains['mem_total'] - 10000 }}M
      innodb_file_io_threads: {{ grains['num_cpus'] - 2 }}
      innodb_thread_concurrency: '30'
      innodb_flush_log_at_trx_commit: '0'   
      innodb_data_file_path: 'ibdata1:100M:autoextend'
      innodb_flush_method: 'O_DSYNC'
      innodb_log_buffer_size: '128M'
      innodb_log_file_size: '256M'
      innodb_log_files_in_group: '10'
      innodb_max_dirty_pages_pct: '90'
      innodb_lock_wait_timeout: '50'
    myisam:
      key_buffer_size: '384M'
      read_buffer_size: '4M'
      read_rnd_buffer_size: '8M'
      myisam_sort_buffer_size: '128M'
      myisam_max_sort_file_size: '1G'
      myisam_repair_threads: '1'
      recover_options: 'default'
