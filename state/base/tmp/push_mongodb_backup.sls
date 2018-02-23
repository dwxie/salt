{%set prefix = '/opt/sa_tools' %}
{%set file_name = 'mongodb_backup' %}
{%set file_version = '20161118' %}
{%set file_suffix = 'tar.gz' %}

create {{ prefix }} folder:
  file.directory:
    - name: {{ prefix }}
    - user: root
    - group: root
    - dir_mode: 755
    - makedirs: true

push {{ file_name }}.{{ file_version }}.{{ file_suffix }} packet:
  file.managed:
    - name: {{ prefix }}/{{ file_name }}.{{ file_version }}.{{ file_suffix }}
    - source: salt://tmp/{{ file_name }}.{{ file_version }}.{{ file_suffix }}
    - mode: 644
    - user: root
    - group: root

unpack {{ file_name }}.{{ file_version }}.{{ file_suffix }} packet:
  cmd.run:
    - name: tar xf {{ file_name }}.{{ file_version }}.{{ file_suffix }}
    - cwd: {{ prefix }}
    - onlyif:
      - test -f {{ file_name }}.{{ file_version }}.{{ file_suffix }}
      - test ! -d {{ file_name }}

absent {{ prefix }}/{{ file_name }}.{{ file_version }}.{{ file_suffix }} file:
  file.absent:
    - name: {{ prefix }}/{{ file_name }}.{{ file_version }}.{{ file_suffix }}
    - onlyif:
      - test -f {{ prefix }}/{{ file_name }}.{{ file_version }}.{{ file_suffix }}

change permissions:
  cmd.run:
    - name: chown -R  root.root {{ prefix }}/{{ file_name }}
    - cwd: {{ prefix }}/{{ file_name }}
    - onlyif:
      - test -d {{ prefix }}/{{ file_name }}
