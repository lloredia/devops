# 09. Cloud platforms

Cloud work in this repository is mostly vocabulary and one older AWS provisioning example. The glossary here came from [lloredia/Dev-Ops](https://github.com/lloredia/Dev-Ops). Hands-on EC2 provisioning with Ansible is in module 04, because that is where the playbooks live.

## What is in here

| Path | Contents |
| --- | --- |
| `aws/README.md` | Links to the AWS Developer, Solutions Architect, and DevOps Engineer certification pages |
| `aws/AWS Certified Solutions Architect.md` | A personal outline of AWS services (EC2, S3, RDS, IAM, VPC, and others) with short definitions. Many headings are stubs |

Empty Azure and MQ notes from Dev-Ops were not substantial enough to teach from. They are in `archive/dev-ops-placeholders/`.

## How to use the notes

Read `aws/AWS Certified Solutions Architect.md` next to the official AWS documentation for any service you have not used. The outline is a map, not a lab, and some product names have changed since it was written (for example Glacier's positioning).

When you want to create infrastructure, use `04-ansible/aws-ec2/` on an account you control, or the AWS console's free tier, and tear the resources down when you finish. This module does not include credentials. Do not add any.

## Practice

1. Pick five services in the outline that have only a heading. Write two sentences each, in your own words, on what problem the service is for.
2. Draw a small architecture: one VPC, two subnets, one EC2 instance, one security group, one S3 bucket. Label which subnet is public and how the instance is reached. Do not create it yet if you are not ready to pay for it or to destroy it.
3. From module 04, list every value in `aws-ec2/ec2-rer.yml` that is account-specific (AMI, region, key name, CIDR). Say where each should come from instead of the playbook.
4. Compare IAM users, IAM roles, and access keys. Which one should a playbook running on your laptop use, and which one should an EC2 instance use to talk to S3?
