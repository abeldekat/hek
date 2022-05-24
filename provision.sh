#! /bin/bash
ansible-playbook -i inventory/hosts -e "ansible_ssh_user=root" provision.yml 
