# AWS-Terraform-Infrastructure
<br><br>
<b>Resources created:<br>
EKS Cluster<br>
S3 Bucket<br>
DynamoDB Table<br>
EC2 Instance<br>
</b>
Before creating the cluster for deployment, move to the modules/S3-Bucket folder and use:<br>
<b>terraform init</b><br>
<b>terraform plan</b><br>
<b>terraform apply</b><br>

The modules/EKS-Cluster folder contains the infrastructure required in order to create a Kubernetes cluster on EKS.<br>

<b>This configuration creates the following:</b><br><br>
A VPC with 2 public subnets and 2 private subnets and 2 NAT Gateways for the public subnets.<br>
An EKS managed node group with autoscaling enabled that runs on t2.medium.<br>
The autoscaling group scales between 2 and 10 nodes according to the CPU utilization.<br>
A security group that allows the users to communicate with the cluster and configured it with fine-grained access<br>
<br>
The .github/workflows directory contains the code for triggering a GitHub actions pipeline for provisioning the infrastructure.
