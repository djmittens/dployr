FROM alpine:latest

RUN apk add --no-cache ansible openssh

ADD ./machine.py /machine.py
ADD ./playbooks /playbooks
ADD ./conf/ansible.cfg /etc/ansible/ansible.cfg
ADD ./entrypoint.sh /entrypoint.sh

entrypoint ["./entrypoint.sh"]
cmd ["/playbooks/bootstrap.yml"]
