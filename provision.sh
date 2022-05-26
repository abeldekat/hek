#! /bin/bash
# IP_subject_alt_name: cloud_instance_ip, cloud_post.yml
# in digital ocean yml: cloud_instance_ip: "{{ (droplet.networks.v4 | selectattr('type', '==', 'public')).0.ip_address }}"
# This is also used in server.yml, for the folder name in configs
# it also becomes the inventory_host_name in the dump .config.yml dump
#
# unique_name: true, digital ocean yml
# ipv6: true digital ocean yml -> when creating a droplet, also activate ipv6
# see /etc/network/interfaces/cloud_init
ansible-playbook -e "ansible_ssh_user=root" provision.yml 
