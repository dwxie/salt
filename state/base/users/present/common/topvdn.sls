add group for topvdn:
  group.present:
    - name: topvdn
    - gid: 62016

add user for topvdn:
  user.present:
    - name: topvdn
    - fullname: Topvdn Ops User
    - shell: /bin/bash
    - home: /home/topvdn
    - uid: 62016
    - gid: 62016

create /home/topvdn directory for topvdn:
  file.directory:
    - name: /home/topvdn
    - user: topvdn
    - group: topvdn
    - dir_mode: 755
