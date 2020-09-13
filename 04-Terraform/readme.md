## This Terraform creates the following aws resources

### Network Module
    - VPC
    - Subnets 
    - Routetable
    - Internet-Gateway
    - NAT-Gateway
    - Routes
    - Route Table Association
    - Security Groups
   
### Public Ec2 Instances Module
    
    - Launch Configuration
    - Autoscaling Group
    - EC2
    - EBS
    - Key Pair
    
    

#### Quick Start
```
terraform init
terraform plan -var-file=environments/task.tfvars
terraform apply -var-file=environments/task.tfvars
```




#### vpc module

This would create all our networking resources like vpc,subnets,internetgateway and NAT gateway.
This would create subnets in all the distinctly available zones before using the same AZ again.
```
terraform apply -target=module.vpc -var-file=environment/task.tfvars
```



#### public_ec2_instances module


```
terraform apply  -target=module.public_ec2 -var-file=environment/task.tfvars

```
 This creates the following resources:
 
 1. Launch configuration and Auto Scaling Group 
 2. 3 instances in public subnet.
 3. A key pair. You can find the public and private content with the name public_ec2_key_pair.
 
 

 


