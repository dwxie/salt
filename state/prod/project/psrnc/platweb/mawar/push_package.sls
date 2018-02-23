{% set prefix = '/var/www' %}
{% set name = "mawar" %}
{% set version = '1.12.1' %}
{% set suffix = 'tar.gz' %}
{% set sha1 = '85ad39a173380d6505cc9406e14f5ba4a1183495' %}
{% set download_domain = 'file.topvdn.com' %}
{% set source_prefix = "http://" + download_domain + "/compiled/nginx/cos" %}

create {{ prefix }} folder:
  file.directory:
    - name: {{ prefix }}
    - user: root
    - group: root
    - dir_mode: 755
    - makedirs: true

push {{ name }}-{{ version }}.tar.gz packet:
  file.managed:
    - name: {{ prefix }}/{{ name }}-{{ version }}.{{ suffix }}
    - source: {{ source_prefix }}/{{ name }}-{{ version }}.{{ suffix }}
    - source_hash: sha1={{ sha1 }}
    - mode: 644
    - user: root
    - group: root

unpack {{ prefix }}/{{ name }}-{{ version }}.tar.gz packet:
  cmd.run:
    - name: tar xf {{ name }}-{{ version }}.{{ suffix }}
    - cwd: {{ prefix }}
    - onlyif:
      - test -f {{ prefix }}/{{ name }}-{{ version }}.{{ suffix }}
      - test ! -d {{ prefix }}/{{ name }}-{{ version }}

create a symbolic link from {{ name }}-{{ version }} to {{ name }}:
  cmd.run:
    - name: ln -sf {{ name }}-{{ version }} {{ name }}
    - cwd: {{ prefix }}
    - onlyif:
      - test ! -f {{ prefix }}/{{ name }}
      - test ! -h {{ prefix }}/{{ name }}
      - test -d {{ prefix }}/{{ name }}-{{ version }}

absent {{ prefix }}/{{ name }}-{{ version }}.{{ suffix }} file:
  file.absent:
    - name: {{ prefix }}/{{ name }}-{{ version }}.{{ suffix }}
    - onlyif:
      - test -f {{ prefix }}/{{ name }}-{{ version }}.{{ suffix }}
