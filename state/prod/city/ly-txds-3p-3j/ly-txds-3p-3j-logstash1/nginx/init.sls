# salt ly-txds-3p-3j-logstash1 state.sls city.ly-txds-3p-3j.ly-txds-3p-3j-logstash1.nginx saltenv=prod
include:
  - ...nginx.config.nginx
  - .config
