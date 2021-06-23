---
{%- set testing = salt['pillar.get']('testing') %}
{% if testing %}

# SCHEDULE DAILY STATE APPLY
# Run state.apply module every day at 10am.  This wil ensure changes to states are always applied, and to ensure modules
# like pkg.uptodate are run routinely.
state_apply_schedule:
  schedule.present:
    - function: state.apply
    - cron: 0 10 * * *

{% endif %}
