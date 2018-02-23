include:
  - ....backend.service
  - .config
virtual_server 192.168.2.248 443 {
    delay_loop 30
    lb_algo wlc
    lb_kind DR
#    persistence_timeout 5
    protocol TCP
    real_server 192.168.2.221 443 {
        weight 1
        TCP_CHECK {
            connect_timeout 3
            nb_get_retry 2
            delay_before_retry 2
            connect_port 443
            }
        }
    real_server 192.168.2.224 443 {
        weight 1
        TCP_CHECK {
            connect_timeout 3
            nb_get_retry 2
            delay_before_retry 2
            connect_port 443
        }
    }
}
