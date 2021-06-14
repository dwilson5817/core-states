---
# UPDATE ALL PACKAGES
# All packages on the system will be upgraded.  This is the equivalent of running 'apt update' and 'apt upgrade' on
# Ubuntu.  This ensures packages are always up to date but this state can take some time to complete if a lot of
# packages need to be upgraded.
update:
  pkg.uptodate:
    - refresh: True
