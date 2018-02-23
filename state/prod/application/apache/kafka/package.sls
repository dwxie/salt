{% set prefix = '/opt' %}
{% set name = 'kafka' %}
{% set version = '2.11-0.10.1.0' %}
{% set suffix = 'tgz' %}
{% set sha1 = '710f31e70ab754bfd5333278e22682c98dd056ca' %}
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

push {{ name }}_{{ version }}.{{ suffix }} packet:
  file.managed:
    - name: {{ prefix }}/{{ name }}_{{ version }}.{{ suffix }}
    - source: {{ source_prefix }}/{{ name }}_{{ version }}.{{ suffix }}
    - source_hash: sha1={{ sha1 }}
    - mode: 644
    - user: {{ user }}
    - group: {{ group }}

unpack {{ name }}_{{ version }}.{{ suffix }} packet:
  cmd.run:
    - name: tar xf {{ name }}_{{ version }}.{{ suffix }}
    - cwd: {{ prefix }}
    - onlyif:
      - test -f {{ name }}_{{ version }}.{{ suffix }}
      - test ! -d {{ name }}_{{ version }}

create a symbolic link from {{ prefix }}/{{ name }}_{{ version }} to {{ prefix }}/{{ name }}:
  file.symlink:
    - name: {{ prefix }}/{{ name }}
    - target: {{ name }}_{{ version }}
    - force: True
    - user: {{ user }}
    - group: {{ group }}
    - onlyif:
      - test ! -f {{ prefix }}/{{ name }}
      - test ! -h {{ prefix }}/{{ name }}
      - test -d {{ prefix }}/{{ name }}_{{ version }}

absent {{ prefix }}/{{ name }}_{{ version }}.{{ suffix }} file:
  file.absent:
    - name: {{ prefix }}/{{ name }}_{{ version }}.{{ suffix }}
    - onlyif:
      - test -f {{ prefix }}/{{ name }}_{{ version }}.{{ suffix }}

change permissions:
  cmd.run:
    - name: chown -R {{ user }}.{{ group }} {{ prefix }}/{{ name }}-{{ version }}
    - cwd: {{ prefix }}
    - onlyif:
      - test -d {{ prefix }}/{{ name }}-{{ version }}
