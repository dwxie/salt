{% set source_prefix = "salt://users/files/keys/ops" %}
{% set user = 'sysadmin' %}
{% set group = 'sysadmin' %}

add group for {{ group }}:
  group.present:
    - name: {{ group }}

add user for {{ user }}:
  user.present:
    - name: {{ user }}
    - fullname: Topvdn Ops User
    - shell: /bin/bash
    - home: /home/{{ user }}
    - groups:
      - {{ user }}

create /home/{{ user }} directory for {{ user }}:
  file.directory:
    - name: /home/{{ user }}
    - user: {{ user }}
    - group: {{ group }}
    - dir_mode: 755

create .ssh directory for {{ user }}:
  file.directory:
    - name: /home/{{ user }}/.ssh
    - user: {{ user }}
    - group: {{ group }}
    - file_mode: 644
    - dir_mode: 700
    - makedirs: True
    - recurse:
      - user
      - group

sync authorized_keys file for {{ user }}:
  file.managed:
    - name: /home/{{ user }}/.ssh/authorized_keys
    - source: {{ source_prefix }}/{{ user }}_rsa.pub
    - mode: 400
    - user: {{ user }}
    - group: {{ group }}
