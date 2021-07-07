### Infrastructure Overview
AWS Infra includes the following:
1. 2 Ubuntu instances
2. 1 VPC
3. Internet Gateway
4. Private Subnet
5. Route Table
6. Security Group

## IAM Credentials
Username: pkum5862@hotmail.com
Password: ;9u~MU8Rw,Q;bk6

## Infra can be provisioned with executing following commands in sequence:
`terrafrom init`
`terraform plan`
`terraform apply`
I tested provisioning infra, and deleted it from the portal for now.

## Nginx webserver
To install nginx webserver on both instances, YAML script `nginx.yml` need to be executed. However couldn't spend much time on it
to automate that. The script would be run manually on the machines.

## Routing traffic between the servers
I couldn't implement a fully workable solution, thus not included with submission.
