{%set prefix = '/opt' %}
{%set proc_name = 'web-api' %}
{%set version = '3.0' %}
{%set suffix = 'tar.gz' %}
{%set sha1 = '83907d797d26dd7371094202f7bf3b8c2d89a6c3' %}
{%set download_domain = 'file.topvdn.com' %}

create {{ prefix }} folder:
  file.directory:
    - name: {{ prefix }}
    - user: root
    - group: root
    - dir_mode: 755
    - makedirs: true

push {{ proc_name }}-{{ version }}.{{ suffix }} packet:
  file.managed:
    - name: {{ prefix }}/{{ proc_name }}-{{ version }}.{{ suffix }}
    - source: http://{{ download_domain }}/cyqz/{{ proc_name }}-{{ version }}.{{ suffix }}
    - source_hash: sha1={{ sha1 }}
    - mode: 644
    - user: root
    - group: root
    - onlyif:
      - test ! -f {{ prefix }}/{{ proc_name }}-{{ version }}.{{ suffix }}

unpack {{ proc_name }}-{{ version }}.{{ suffix }} packet:
  cmd.run:
    - name: tar xf {{ proc_name }}-{{ version }}.{{ suffix }}
    - cwd: {{ prefix }}
    - onlyif:
      - test -f {{ proc_name }}-{{ version }}.{{ suffix }}
      - test ! -d {{ prefix }}/{{ proc_name }}-{{ version }}

absent {{ prefix }}/{{ proc_name }}-{{ version }}.{{ suffix }} file:
  file.absent:
    - name: {{ prefix }}/{{ proc_name }}-{{ version }}.{{ suffix }}
    - onlyif:
      - test -f {{ prefix }}/{{ proc_name }}-{{ version }}.{{ suffix }}

change permissions:
  cmd.run:
    - name: chown -R root.root {{ prefix }}/{{ proc_name }}
    - cwd: {{ prefix }}
    - onlyif:
      - test -d {{ prefix }}/{{ proc_name }}
