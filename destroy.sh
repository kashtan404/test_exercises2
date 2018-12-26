#!/bin/bash

docker run -it -v $HOME/.aws:/root/.aws -v $PWD:/opt helldrum/alpine-terraform-ansible:latest /bin/sh -c 'cd /opt/terraform; terraform destroy -input=false'
