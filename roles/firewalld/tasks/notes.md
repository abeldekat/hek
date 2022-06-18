---
# See tutorials: https://www.procustodibus.com/
# Note: in these tutorials zone drifting occurs
# useful commands:
# ip -brief address show
# nmcli connecton show
# Using nmcli on laptop to bind a connection to a firewald zone:
# sudo nmcli connection modify "<mywireless>" connection.zone home
#
# Note that the --reload command clears any non-permanent changes you have made,
# so use the --runtime-to-permanent command first if you have any temporary firewalld runtime changes you want to save before reloading.
#
# ss -tn | grep :22, find the ip in use by ssh
#
one ip
# fwp --new-ipset=tsixip --type=hash:ip --option=family=inet6
multiple ip
# fwp --new-ipset=tsixips --type=hash:net --option=family=inet6
#
#
# ip firewalld and ip6 firewalld do the nat postrouting
# there is also some mangle and raw in inet firewalld
#
# Policy good example: built in allow_host_ipv6

ansible ip set example:
- name: Capture safeipfour ipset is present
  ansible.builtin.shell: |
    set -o pipefail && \
    firewall-cmd --get-ipsets | grep -c safeipfour || true
  args:
    executable: /bin/bash
  register: safeipfour_result
  changed_when: false

# reload immediately
- name: Ensure safeipfour ipset is present
  ansible.builtin.shell: |
    firewall-cmd --permanent --new-ipset=safeipfour --type=hash:ip --option=family=inet && \
    firewall-cmd --reload
  args:
    executable: /bin/bash
  when: safeipfour_result.stdout == '0'

- name: Ensure safeip4 ipset contains ips
  ansible.builtin.shell: |
    firewall-cmd --ipset=safeipfour --add-entry="<theip4>" && \
    firewall-cmd --runtime-to-permanent
  args:
    executable: /bin/bash
  when: safeipfour_result.stdout == '0'

- name: Ensure safeipfour ipset is bound to admin zone
  ansible.builtin.shell: |
    firewall-cmd --zone=adminvps --add-source=ipset:safeipfour && \
    firewall-cmd --runtime-to-permanent
  args:
    executable: /bin/bash
  when: safeipfour_result.stdout == '0'
