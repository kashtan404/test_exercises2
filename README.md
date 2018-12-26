# test_exercises2
This is a repo for one good company to show my abilities

So, firstly I wrote Terraform code which creates VPC, internet gateway, subnets, route tables, security group, EC2 instances.
Also, it creates inventory for Ansible.

Then Ansible will run container with nginx+php-fpm on the web host and container with postgres on other hosts (postgres will be started as a master-slave cluster). And finally it creates a table 'blocked' for point 4.

You cant curl http://_host_/?n=x and it returns Fibonacci numbers.

Last part (4) partially done cuz nginx+php-fpm container doesn't contain php driver for postgres and I don't really want rebuild it into my own image.
It could be easily solved with 'bare-metal' installation, but I decided to run all of it in docker.
Also, I'm a not good in PHP, so, I'm not sure this code could work perfectly.

Why run in docker? - Forstly, obviously it easier than writing/looking for right ansible role. Secondly, it keeps clean VMs. And finally, I like docker.

And final note: Yes, it contains some strange things like 'hardcode', 'crutches', 'creative approach'. But I will never mean this solution as a production-ready, only just as a proof-of-concept.

**Usage**:
```
# To bootstrap AWS resources and provision with ansible
./run.sh
```

```
# To destroy AWS resources
./destroy.sh
```

## Execrise <h2>

Using the automation tools of your choice prepare a FULLY provisioned
cloud environment in AWS.

This automation should do:

1. Deploy 3 EC2 nodes (App, DB Master (PostgreSQL), DB Slave (PostgreSQL) based on the last stable Debian.
2. Setup Nginx+php-fpm on App VM and deploy PHP code that will respond to the URL like 'http://_host_/?n=x', where 'x' is number. This request should return Fibonacci ’n’ numbers starting from 0.
3. Setup master-slave (replication) PostgreSQL between node 2 and 3.
4. Prepare a solution that adds a special URL path “/blacklisted” with requirements:

- return error code 444 to the visitor
- block the IP of the visitor
- send an email with IP address to "test@domain.com"
- insert into PostgreSQL table information: path, IP address of the visitor and datetime when he got blocked