base:
  g_ly_txds_3p_3j:
    - match: nodegroup
    - ly-txds-3p-3j.ntpdate
    - ly-txds-3p-3j.zabbix
    - ly-txds-3p-3j.common
  g_ly_txds_3p_3j_elastic:
    - match: nodegroup
    - ly-txds-3p-3j.elastic
    - ly-txds-3p-3j.elastic.elasticsearch
  g_ly_txds_3p_3j_logstash:
    - match: nodegroup
    - ly-txds-3p-3j.elastic.logstash
    - ly-txds-3p-3j.elastic.kibana
  g_ly_txds_3p_3j_tracker:
    - match: nodegroup
    - antelope.cs.tracker.tracker
    - antelope.cs.tracker.relay_group
    - antelope.cs.tracker.cid_bond_relay
    - antelope.cs.tracker.selection_strategy
    - antelope.cs.tracker.white_list
    - antelope.cs.tracker.relay_extra_info
  ly-txds-3p-3j-tracker:
    - ly-txds-3p-3j.machines.ly-txds-3p-3j-tracker
  ly-txds-3p-3j-elastic1:
    - ly-txds-3p-3j.machines.ly-txds-3p-3j-elastic1
  ly-txds-3p-3j-elastic2:
    - ly-txds-3p-3j.machines.ly-txds-3p-3j-elastic2
  ly-txds-3p-3j-elastic3:
    - ly-txds-3p-3j.machines.ly-txds-3p-3j-elastic3
  ly-txds-3p-3j-elastic4:
    - ly-txds-3p-3j.machines.ly-txds-3p-3j-elastic4
  ly-txds-3p-3j-elastic5:
    - ly-txds-3p-3j.machines.ly-txds-3p-3j-elastic5
  ly-txds-3p-3j-elastic6:
    - ly-txds-3p-3j.machines.ly-txds-3p-3j-elastic6
  ly-txds-3p-3j-elastic7:
    - ly-txds-3p-3j.machines.ly-txds-3p-3j-elastic7
  ly-txds-3p-3j-logstash1:
    - ly-txds-3p-3j.elastic.cerebro
    - ly-txds-3p-3j.machines.ly-txds-3p-3j-logstash1
  ly-txds-3p-3j-logstash2:
    - ly-txds-3p-3j.machines.ly-txds-3p-3j-logstash2
  ly-txds-3p-3j-logstash3:
    - ly-txds-3p-3j.machines.ly-txds-3p-3j-logstash3
  ly-txds-3p-3j-elkstaging1:
    - ly-txds-3p-3j.elastic_staging.elasticsearch
    - ly-txds-3p-3j.elastic_staging.cerebro
    - ly-txds-3p-3j.elastic_staging.kibana
    - ly-txds-3p-3j.machines.ly-txds-3p-3j-elkstaging1
  ly-txds-3p-3j-free4:
    - antelope.cs.relay.relay
    #- tz.relay
    #- tmp.tz-mid-1960
    #- tmp.tz-mid-1970
    #- tmp.tz-mid-1961
    #- tmp.tz-mid-1971
    - cs-hhy-a2-05.relay
    #- tmp.cs-mid-1960
    #- tmp.cs-mid-1970
    #- tmp.cs-mid-1961
    - tmp.cs-mid-1971
