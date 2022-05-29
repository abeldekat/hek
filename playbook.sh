#! /bin/bash

# fatal: [localhost]: FAILED! => {"msg": "The ipaddr filter requires python's netaddr be installed on the ansible controller"}
# --> pip install netaddr

# ansible [core 2.12.5]
#   config file = /home/user/git/github/algo/ansible.cfg
#   configured module search path = ['/home/user/.ansible/plugins/modules', '/usr/share/ansible/plugins/modules']
#   ansible python module location = /usr/lib/python3.10/site-packages/ansible
#   ansible collection location = /home/user/.ansible/collections:/usr/share/ansible/collections
#   executable location = /usr/bin/ansible
#   python version = 3.10.4 (main, Mar 23 2022, 23:05:40) [GCC 11.2.0]
#   jinja version = 3.0.3
#   libyaml = True

# ansible-playbook -K playbook.yml --tags="searxng"
# ansible-playbook -K playbook.yml --skip-tags="common,dns,wireguard,searxng"
ansible-playbook -K playbook.yml
