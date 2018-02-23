MachineID: 756363758
camera:
  nginx: {upstream_ip1: 127.0.0.1, upstream_ip2: 192.168.2.24, upstream_ip3: 192.168.2.44}
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
