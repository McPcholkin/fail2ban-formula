# -*- coding: utf-8 -*-
# vim: ft=sls

{% from "fail2ban/ng/map.jinja" import fail2ban with context %}

fail2ban.ng.service:
{% if fail2ban.enabled %}
    service.running:
        - name: {{ fail2ban.lookup.service }}
        - enable: True
        - require:
            - pkg: {{ fail2ban.lookup.package }}
{% elif fail2ban.enabled == 'False' %}
    service.dead:
        - name: {{ fail2ban.service }}
        - enable: False
{% endif %}
