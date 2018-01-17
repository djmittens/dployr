#!/bin/sh

if[[! -d /root/.ssh]]; then
    echo "Missing host's ssh configuration, please mount it into /root/.ssh"
    exit 1
fi

ansible all -i "localhost," -m raw -a "apt-get install -y python-minimal"

ansible-playbook -i "${TARGET_HOST:-localhost}," "$@"
