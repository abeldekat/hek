
      # - docker-ce=5:20.10.16~3-0~debian-bullseye
      - docker-ce
      # - docker-ce-cli=5:20.10.16~3-0~debian-bullseye
      - docker-ce-cli
      # - containerd.io=1.6.6-1
      - containerd.io
      # - docker-compose-plugin=2.5.0~debian-bullseye
      - docker-compose-plugin
      - "python{{'3' if ansible_python.version.major == 3 else ''}}-docker"

rootless additional:

# rootless mode:
# dbus-user-session, already present
# TODO: rootlesskit
# TODO: After curl, enable docker and restart. Add bin to path!
# service file remove /usr/bin/docker, use docker
https://docs.docker.com/compose/install/compose-plugin/#install-the-plugin-manually


# curl -fsSL https://get.docker.com/rootless | sh
# https://download.docker.com/linux/debian/dists/bullseye/pool/stable/amd64/
# docker-ce=5:20.10.16~3-0~debian-bullseye
# docker-ce-cli=5:20.10.16~3-0~debian-bullseye
# containerd.io=1.6.6-1
# docker-compose-plugin=2.5.0~debian-bullseye
# docker-ce-rootless-extras=5:20.10.16~3-0~debian-bullseye
# -> docker 20.10.17, after reboot, searxng not started

--> the number of engines in searng matters...
1 no wireguard, searxng root: ram 420(starts at 380), 34 tasks, 87 threads
1 no wireguard, searxng rootless: ram 460, 46 tasks, 97 threads: +40 ram 
1 no wireguard, searxng rootless from script without docker repo:
