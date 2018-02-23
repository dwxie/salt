hosts:
  present:
    -
      ip: '192.168.2.20'
      hostnames:
        - nc-sndl-09-07-lvs1
    -
      ip: '192.168.2.30'
      hostnames:
        - nc-sndl-09-10-lvs2
    -
      ip: '192.168.2.12'
      hostnames:
        - nc-sndl-08-02-db1
        - 1.mongodb.private
        - 1.psrnc.mongodb.dynamic
    -
      ip: '192.168.2.22'
      hostnames:
        - nc-sndl-09-07-db2
        - 2.mongodb.private
        - 2.psrnc.mongodb.dynamic
    -
      ip: '192.168.2.32'
      hostnames:
        - nc-sndl-09-10-db3
        - 3.mongodb.private
        - 3.psrnc.mongodb.dynamic
    -
      ip: '192.168.2.44'
      hostnames:
        - nc-sndl-09-12-web1
    -
      ip: '192.168.2.14'
      hostnames:
        - nc-sndl-08-02-web2
    -
      ip: '192.168.2.24'
      hostnames:
        - nc-sndl-09-07-web3
    -
      ip: '192.168.2.34'
      hostnames:
        - nc-sndl-09-10-web4
        - 1.tracker.private
    -
      ip: '192.168.2.43'
      hostnames:
        - nc-sndl-09-12-web5
        - 2.tracker.private
        - disktracker.private
    -
      ip: '192.168.2.13'
      hostnames:
        - nc-sndl-08-02-web6
        - 3.tracker.private
        - indexserver.private
    -
      ip: '192.168.2.19'
      hostnames:
        - nc-sndl-08-02-sto1
    -
      ip: '192.168.2.29'
      hostnames:
        - nc-sndl-09-07-sto2
    -
      ip: '192.168.2.39'
      hostnames:
        - nc-sndl-09-10-sto3
    -
      ip: '192.168.2.48'
      hostnames:
        - nc-sndl-09-12-sto4
    -
      ip: '192.168.2.18'
      hostnames:
        - nc-sndl-08-02-sto5
    -
      ip: '192.168.2.28'
      hostnames:
        - nc-sndl-09-07-sto6
    -
      ip: '192.168.2.38'
      hostnames:
        - nc-sndl-09-10-sto7
    -
      ip: '192.168.2.47'
      hostnames:
        - nc-sndl-09-12-sto8
    -
      ip: '192.168.2.17'
      hostnames:
        - nc-sndl-08-02-sto9
    -
      ip: '192.168.2.27'
      hostnames:
        - nc-sndl-09-07-sto10
    -
      ip: '192.168.2.37'
      hostnames:
        - nc-sndl-09-10-sto11
    -
      ip: '192.168.2.46'
      hostnames:
        - nc-sndl-09-12-sto12
    -
      ip: '192.168.2.16'
      hostnames:
        - nc-sndl-08-02-sto13
    -
      ip: '192.168.2.26'
      hostnames:
        - nc-sndl-09-07-sto14
    -
      ip: '192.168.2.36'
      hostnames:
        - nc-sndl-09-10-sto15
    -
      ip: '192.168.2.45'
      hostnames:
        - nc-sndl-09-12-sto16
    -
      ip: '192.168.2.15'
      hostnames:
        - nc-sndl-08-02-sto17
    -
      ip: '192.168.2.55'
      hostnames:
        - nc-sndl-09-10-sto18
    -
      ip: '192.168.2.52'
      hostnames:
        - nc-sndl-08-02-stofnd1
        - 4.mongodb.private
        - 4.psrnc.mongodb.dynamic
        - healthchecker.private
    -
      ip: '192.168.2.53'
      hostnames:
        - nc-sndl-09-07-stofnd2
        - 5.mongodb.private
        - 5.psrnc.mongodb.dynamic
        - codproducer.private
    -
      ip: '192.168.2.54'
      hostnames:
        - nc-sndl-09-07-stofnd3
        - 6.mongodb.private
        - 6.psrnc.mongodb.dynamic
        - codisktracker.private
  only:
  absent:
