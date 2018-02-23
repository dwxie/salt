MachineID: 756363758
cs:
  center:
    camera:
      nginx:
        vhosts:
          jxsr-console.antelopecloud.cn.conf:
            server_names:
              - 'jxsr-console.antelopecloud.cn'
smpagent:
  plugins:
    collector:
      collector:
        config:
          tasks:
          - {args: python /opt/smpagent/scrpits/get_info/get_info.py, collector: cmd,
            cron: 1 * * * * *, type: service_sys}
          - {args: 'http://127.0.0.1:8004/stats/request', collector: http, cron: 1
              * * * * *, type: service_web}
