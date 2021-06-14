---
# INSTALL NFS LIBRARY
# Install the required NFS library to mount an NFS filesystem.  On Ubuntu this nfs-common, at present only Ubuntu is
# supported.  Other operating systems will refer to this library by a different name.
nfs-common:
  pkg.installed

{% for mount, args in pillar.get('nfs_mounts', {}).items() %}

# MOUNT NFS FILESYSTEM(S)
# Query pillar for a list of NFS locations which should be mounted.  This is used for backup drives.  Note there is no
# authentication here as no drives currently mounted require this (as they use IP-based authentication).
mount_{{ mount }}:
  file.directory:
    - name: /mnt/{{ mount }}
  mount.mounted:
    - name: /mnt/{{ mount }}
    - device: {{ mount }}:{{ args.remote_directory }}
    - mkmnt: true
    - fstype: nfs
    - require:
      - file: /mnt/{{ mount }}

{% endfor %}
