#! /bin/bash

# fatal: [localhost]: FAILED! => {"msg": "The ipaddr filter requires python's netaddr be installed on the ansible controller"}
# --> pip install netaddr

# ansible [core 2.12.5]
#   config file = /home/chris/git/github/algo/ansible.cfg
#   configured module search path = ['/home/chris/.ansible/plugins/modules', '/usr/share/ansible/plugins/modules']
#   ansible python module location = /usr/lib/python3.10/site-packages/ansible
#   ansible collection location = /home/chris/.ansible/collections:/usr/share/ansible/collections
#   executable location = /usr/bin/ansible
#   python version = 3.10.4 (main, Mar 23 2022, 23:05:40) [GCC 11.2.0]
#   jinja version = 3.0.3
#   libyaml = True

# algo: ansible-core==2.12.3
# matrix-ansible: We generally support Ansible 2.7.1 and above.
# no need for:
# provider=digitalocean
# ondemand_cellular=false
# ondemand_wifi=false
ansible-playbook -K playbook.yml -e "server_name=algo
                                dns_adblocking=true
                                ssh_tunneling=true
                                store_pki=true
                                region=ams3
                                do_token=token"
