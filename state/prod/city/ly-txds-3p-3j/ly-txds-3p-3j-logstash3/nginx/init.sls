# salt ly-txds-3p-3j-logstash3 state.sls city.ly-txds-3p-3j.ly-txds-3p-3j-logstash3.nginx saltenv=prod
include:
  - ...nginx.config.nginx
  - .config
