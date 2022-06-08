#! /bin/bash
# ipv6: true digital ocean yml -> when creating a droplet, also activate ipv6
# reference on server: /etc/network/interfaces/cloud_init
#
ansible-playbook -e "ansible_ssh_user=root" provision.yml 
