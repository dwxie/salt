{% set prefix = '/opt' %}
{% set name = 'CONginx' %}
{% set version = '1.1.0' %}
{% set suffix = 'tar.gz' %}
{% set sha1 = '4baa453d41b0436a46c368e032faea54568a0587' %}
{% set user = 'root' %}
{% set group = 'root' %}
{% set download_domain = 'file.topvdn.com' %}
{% set source_prefix = "http://" + download_domain + "/packets/cos" %}

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
    - onlyif:
      - test ! -d {{ prefix }}/{{ name }}

unpack {{ name }}-{{ version }}.{{ suffix }} packet:
  cmd.run:
    - name: tar xf {{ name }}-{{ version }}.{{ suffix }}
    - cwd: {{ prefix }}
    - onlyif:
      - test -f {{ name }}-{{ version }}.{{ suffix }}
      - test ! -d {{ prefix }}/{{ name }}

absent {{ prefix }}/{{ name }}-{{ version }}.{{ suffix }} file:
  file.absent:
    - name: {{ prefix }}/{{ name }}-{{ version }}.{{ suffix }}
    - onlyif:
      - test -f {{ prefix }}/{{ name }}-{{ version }}.{{ suffix }}

change permissions:
  cmd.run:
    - name: chown -R {{ user }}.{{ group }} {{ prefix }}/{{ name }}
    - cwd: {{ prefix }}
    - onlyif:
      - test -d {{ prefix }}/{{ name }}
