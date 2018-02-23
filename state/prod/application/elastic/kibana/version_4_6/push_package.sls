{% set prefix = '/opt' %}
{% set proc_name = 'kibana' %}
{% set version = '4.6.1' %}
{% set package_version = '4.6.1-linux-x86_64' %}
{% set suffix = 'tar.gz' %}
{% set sha1 = 'b0191e833c83a348bbf6b09628756e898cceb73b' %}
{% set download_domain = 'file.topvdn.com' %}
{% set source_prefix = "http://" + download_domain + "/elastic" %}

create {{ prefix }} folder:
  file.directory:
    - name: {{ prefix }}
    - user: root
    - group: root
    - dir_mode: 755
    - makedirs: true

push {{ proc_name }}-{{ package_version }}.{{ suffix }} packet:
  file.managed:
    - name: {{ prefix }}/{{ proc_name }}-{{ package_version }}.{{ suffix }}
    - source: {{ source_prefix }}/{{ proc_name }}-{{ package_version }}.{{ suffix }}
    - source_hash: sha1={{ sha1 }}
    - mode: 644
    - user: root
    - group: root

unpack {{ proc_name }}-{{ package_version }}.{{ suffix }} packet:
  cmd.run:
    - name: tar xf {{ proc_name }}-{{ package_version }}.{{ suffix }}
    - cwd: {{ prefix }}
    - onlyif:
      - test -f {{ proc_name }}-{{ package_version }}.{{ suffix }}
      - test ! -d {{ proc_name }}-{{ version }}
      - test ! -d {{ proc_name }}-{{ package_version }}

move {{ proc_name }}-{{ package_version }} to {{ proc_name }}-{{ version }}:
  cmd.run:
    - name: mv {{ proc_name }}-{{ package_version }} {{ proc_name }}-{{ version }}
    - cwd: {{ prefix }}
    - onlyif:
      - test -d {{ prefix }}/{{ proc_name }}-{{ package_version }}

create a symbolic link from {{ proc_name }}-{{ version }} to {{ proc_name }}:
  cmd.run:
    - name: ln -sf {{ proc_name }}-{{ version }} {{ proc_name }}
    - cwd: {{ prefix }}
    - onlyif:
      - test ! -f {{ proc_name }}
      - test ! -h {{ proc_name }}
      - test -d {{ prefix }}/{{ proc_name }}-{{ version }}

absent {{ prefix }}/{{ proc_name }}-{{ package_version }}.{{ suffix }} file:
  file.absent:
    - name: {{ prefix }}/{{ proc_name }}-{{ package_version }}.{{ suffix }}
    - onlyif:
      - test -f {{ prefix }}/{{ proc_name }}-{{ package_version }}.{{ suffix }}

change permissions:
  cmd.run:
    - name: chown -R root.root {{ prefix }}/{{ proc_name }}-{{ version }}
    - cwd: {{ prefix }}/{{ proc_name }}-{{ version }}
    - onlyif:
      - test -d {{ prefix }}/{{ proc_name }}-{{ version }}

absent {{ prefix }}/{{ proc_name }}/bin/*.bat file:
  cmd.run:
    - name: rm -f {{ prefix }}/{{ proc_name }}/bin/*.bat
    - cwd: {{ prefix }}/{{ proc_name }}
    - onlyif:
      - test -d {{ prefix }}/{{ proc_name }}/bin
