#/bin/bash
ansible-playbook -i ./hosts httpd-rer.yml --private-key /home/learner/.ssh/dev2.pem  -u ec2-user
