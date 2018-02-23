# salt ly-txds-3p-3j-elkstaging1 state.sls city.ly-txds-3p-3j.ly-txds-3p-3j-elkstaging1.nginx saltenv=prod
include:
  - ...nginx.config.nginx
  - .config
