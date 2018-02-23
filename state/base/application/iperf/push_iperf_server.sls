{%set iperf_test_dir = '/backup/script/iperf_test' %}

create {{ iperf_test_dir }} folder:
  file.directory:
    - name: {{ iperf_test_dir }}
    - user: root
    - group: root
    - dir_mode: 777
    - makedirs: true

push iperf_server.sh file:
  file.managed:
    - name: {{ iperf_test_dir }}/iperf_server.sh
    - source: salt://application/iperf/files/iperf_server.sh
    - mode: 755
    - user: root
    - group: root
