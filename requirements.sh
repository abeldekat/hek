#!/usr/bin/env bash

# on manjaro, ansible installed:
# ansible --version 2.13.1, the core
# Packages (1) ansible-5.9.0-1
# python 3.10.5
# pip -V 21.0

set -e

# For now, only consider system installation on arch-manjaro and virtualenv installation inside directory

_install_systemwide_on_arch(){
  sudo pacman -S ansible
  # Packages (7):
  # ansible-core-2.13.1-1 
  # python-bcrypt-3.2.1-1  python-jinja-1:3.1.2-1 
  # python-markupsafe-2.1.1-1  python-paramiko-2.11.0-1  python-pynacl-1.4.0-5 
  # ansible-5.9.0-1
  #
  #   Optional dependencies for python-jinja
  #     python-babel: for i18n support
  # (6/7) installing ansible-core                                                                                      [---------------------------------------------------------------------] 100%
  # Optional dependencies for ansible-core
  #     sshpass: for ssh connections with password
  #     python-passlib: crypt values for vars_prompt
  #     python-netaddr: for the ipaddr filter
  #     python-systemd: log to journal [installed]
  #     python-pywinrm: connect to Windows machines
  #     python-dnspython: for dig lookup [installed]
  #     python-jmespath: json_query support

  sudo pacman -S python-netaddr
  # python-netaddr-0.8.0-5-any

  sudo pacman -S ansible-lint
  # Packages (18) python-ansible-compat-2.1.0-1  python-bracex-2.3-1  python-commonmark-0.9.1-5  python-docutils-1:0.18.1-1  python-enrich-1.2.7-1  python-future-0.18.2-7
  #             python-jsonschema-3.2.0-6  python-pathspec-0.9.0-3  python-pyaml-21.10.1-1  python-pyrsistent-0.18.1-1  python-rich-12.4.4-1  python-ruamel-yaml-0.17.21-1
  #             python-ruamel.yaml.clib-0.2.6-3  python-subprocess-tee-0.3.5-3  python-typing_extensions-4.2.0-1  python-wcmatch-8.4-1  yamllint-1.26.2-2  ansible-lint-6.3.0-1

  sudo pip install segno
  # Collecting segno
  # Using cached segno-1.5.2-py2.py3-none-any.whl (83 kB)
  # Installing collected packages: segno
  # Successfully installed segno-1.5.2
}

# TODO
_install_in_virtual_env(){
  echo todo
 # python -m virtualenv .env
 # python -m pip install -U pip virtualenv
  # # pip installed ?
  # python3 -m pip -V
  # # extra/python-pip 21.0-1 [installed]
  # # The PyPA recommended tool for installing Python packages
  # # sudo pacman -Ss python-pip
  # #
  # # Use pip in your selected Python environment to install the Ansible package of your choice for the current user:
  # python3 -m pip install --user ansible
  # # Alternately, you can install a specific version of ansible-core in this Python environment:
  # python3 -m pip install --user ansible-core==2.12.3
  # python3 -m pip install --upgrade --user ansible
  # # The version displayed by this command is for the associated ansible-core package that has been installed.
  # ansible --version
  # # To check the version of the ansible package that has been installed:
  # python3 -m pip show ansible
}

action=$1
shift
case "$action" in
  "install_systemwide_on_arch") _install_systemwide_on_arch ;;
  "install_in_virtual_env") _install_in_virtual_env ;;
  *) echo -e "Unknown subcommand. " && exit 1 ;;
esac
