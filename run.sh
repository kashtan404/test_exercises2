#!/bin/bash

yes y | ssh-keygen -q -t rsa -N '' -f ./id_rsa >/dev/null

docker run -it -v $HOME/.aws:/root/.aws -v $PWD:/opt helldrum/alpine-terraform-ansible:latest /bin/sh -c 'cd /opt/terraform; terraform init; terraform apply -input=false'

hostip1=`docker run -it -v $PWD:/opt helldrum/alpine-terraform-ansible:latest /bin/sh -c 'cd /opt/terraform; terraform output node1_ip'`
hostip2=`docker run -it -v $PWD:/opt helldrum/alpine-terraform-ansible:latest /bin/sh -c 'cd /opt/terraform; terraform output node2_ip'`
hostip3=`docker run -it -v $PWD:/opt helldrum/alpine-terraform-ansible:latest /bin/sh -c 'cd /opt/terraform; terraform output node3_ip'`

read -p "Waiting five minutes for executing userdata..." -t 300

docker run -it -e ANSIBLE_HOST_KEY_CHECKING="False" -v $PWD:/opt helldrum/alpine-terraform-ansible:latest /bin/sh -c 'cd /opt/ansible; ansible-playbook -i hosts site.yml --private-key /opt/id_rsa'

echo "Check Fibonachi url:"
echo "http://$hostip1/index.php?n=20"
