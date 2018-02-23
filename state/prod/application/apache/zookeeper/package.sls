{% set prefix = '/opt' %}
{% set name = 'zookeeper' %}
{% set version = '3.4.11' %}
{% set suffix = 'tar.gz' %}
{% set sha1 = '9268b4aed71dccad3d7da5bfa5573b66d2c9b565' %}
{% set user = 'root' %}
{% set group = 'root' %}
{% set download_domain = 'file.topvdn.com' %}
{% set source_prefix = "http://" + download_domain + "/packets" %}

create {{ prefix }} folder:
  file.directory:
    - name: {{ prefix }}
    - user: {{ user }}
    - group: {{ group }}
    - dir_mode: 755
    - makedirs: true

push {{ name }}-{{ version }}.{{ suffix }} packet:
  file.managed:
    - name: {{ prefix }}/{{ name }}-{{ version }}.{{ suffix }}
    - source: {{ source_prefix }}/{{ name }}-{{ version }}.{{ suffix }}
    - source_hash: sha1={{ sha1 }}
    - mode: 644
    - user: {{ user }}
    - group: {{ group }}

unpack {{ name }}-{{ version }}.{{ suffix }} packet:
  cmd.run:
    - name: tar xf {{ name }}-{{ version }}.{{ suffix }}
    - cwd: {{ prefix }}
    - onlyif:
      - test -f {{ name }}-{{ version }}.{{ suffix }}
      - test ! -d {{ name }}-{{ version }}

create a symbolic link from {{ prefix }}/{{ name }}-{{ version }} to {{ prefix }}/{{ name }}:
  file.symlink:
    - name: {{ prefix }}/{{ name }}
    - target: {{ name }}-{{ version }}
    - force: True
    - user: {{ user }}
    - group: {{ group }}
    - onlyif:
      - test ! -f {{ prefix }}/{{ name }}
      - test ! -h {{ prefix }}/{{ name }}
      - test -d {{ prefix }}/{{ name }}-{{ version }}

absent {{ prefix }}/{{ name }}-{{ version }}.{{ suffix }} file:
  file.absent:
    - name: {{ prefix }}/{{ name }}-{{ version }}.{{ suffix }}
    - onlyif:
      - test -f {{ prefix }}/{{ name }}-{{ version }}.{{ suffix }}

change permissions:
  cmd.run:
    - name: chown -R {{ user }}.{{ group }} {{ prefix }}/{{ name }}-{{ version }}
    - cwd: {{ prefix }}
    - onlyif:
      - test -d {{ prefix }}/{{ name }}-{{ version }}
