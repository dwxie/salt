add group for elasticsearch:
  group.present:
    - name: elasticsearch
    - gid: 63001

add user for elasticsearch:
  user.present:
    - name: elasticsearch
    - fullname: Topvdn Ops User
    - shell: /bin/false
    - createhome: False
    - uid: 63001
    - gid: 63001
