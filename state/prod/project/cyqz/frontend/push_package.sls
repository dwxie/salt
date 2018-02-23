{%set prefix = '/opt' %}
{%set proc_name = 'cyqz_web' %}
{%set suffix = 'tar.gz' %}
{%set sha1 = '6a2b28ccc4f4d59ae6e5868d884948f59ecc9cdc' %}
{%set download_domain = 'file.topvdn.com' %}

create {{ prefix }} folder:
  file.directory:
    - name: {{ prefix }}
    - user: root
    - group: root
    - dir_mode: 755
    - makedirs: true

push {{ proc_name }}.{{ suffix }} packet:
  file.managed:
    - name: {{ prefix }}/{{ proc_name }}.{{ suffix }}
    - source: http://{{ download_domain }}/cyqz/{{ proc_name }}.{{ suffix }}
    - source_hash: sha1={{ sha1 }}
    - mode: 644
    - user: root
    - group: root
    - onlyif:
      - test ! -f {{ prefix }}/{{ proc_name }}.{{ suffix }}

unpack {{ proc_name }}.{{ suffix }} packet:
  cmd.run:
    - name: tar xf {{ proc_name }}.{{ suffix }}
    - cwd: {{ prefix }}
    - onlyif:
      - test -f {{ proc_name }}.{{ suffix }}
      - test ! -d {{ prefix }}/{{ proc_name }}

absent {{ prefix }}/{{ proc_name }}.{{ suffix }} file:
  file.absent:
    - name: {{ prefix }}/{{ proc_name }}.{{ suffix }}
    - onlyif:
      - test -f {{ prefix }}/{{ proc_name }}.{{ suffix }}

change permissions:
  cmd.run:
    - name: chown -R root.root {{ prefix }}/{{ proc_name }}
    - cwd: {{ prefix }}
    - onlyif:
      - test -d {{ prefix }}/{{ proc_name }}
