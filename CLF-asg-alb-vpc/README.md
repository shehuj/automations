AWS CloudFormation: VPC, ALB, EC2 Auto Scaling, and Apache Web Server

This CloudFormation template provisions a secure, scalable web application environment in AWS. It creates a Virtual Private Cloud (VPC) with three public subnets, an Application Load Balancer (ALB), an Auto Scaling Group (ASG) of EC2 instances running Apache with a custom web page, and the necessary security groups.

Architecture Overview:

The template sets up the following AWS resources: ￼
• VPC: A Virtual Private Cloud with CIDR block 10.10.0.0/16.
• Subnets: Three public subnets across different Availability 

Zones:
• 10.10.1.0/24
• 10.10.2.0/24
• 10.10.3.0/24

• Internet Gateway: Provides internet access to the VPC.
• Route Table: Associates routes for internet access.
• Security Groups:
• LoadBalancerSG: Allows HTTP traffic (port 80) from anywhere.
• WebServerSG: Allows HTTP traffic only from the ALB.
• Application Load Balancer: Distributes incoming HTTP traffic across EC2 instances.
• Target Group: Monitors and routes traffic to healthy EC2 instances.
• Listener: Listens for HTTP requests on port 80 and forwards them to the target group.
• Launch Template: Specifies EC2 instance configuration, including Apache installation and a custom HTML page.
• Auto Scaling Group: Manages a fleet of EC2 instances, scaling between 2 and 5 instances based on demand. ￼

Parameters
• LatestAmiId: The latest Ubuntu 22.04 LTS (Jammy) AMI ID fetched dynamically using SSM Parameter Store.
• KeyName: (Optional) EC2 KeyPair for SSH access to instances. If not provided, SSH access is disabled.

Conditions
• HasKeyPair: Determines if an EC2 KeyPair is provided.

Deployment Instructions

1. Prepare the Template

Save the provided CloudFormation YAML template to a file, e.g., web-app-infrastructure.yml.

2. Deploy via AWS Management Console
1. Log in to the AWS Management Console.
2. Navigate to CloudFormation.
3. Click Create stack → With new resources (standard).
4. Under Specify template, choose Upload a template file and upload your web-app-infrastructure.yml file.
5. Click Next.
6. Enter a Stack name (e.g., WebAppStack).
7. Under Parameters, provide a KeyPair name if SSH access is required.
8. Click Next, review the settings, and click Create stack. ￼

3. Monitor Stack Creation

Monitor the stack creation process in the CloudFormation console. The status will change to CREATE_COMPLETE once all resources are provisioned. ￼

Outputs

Upon successful stack creation, the following output is available:

• LoadBalancerDNS: The DNS name of the Application Load Balancer. Use this to access the deployed web application.

Security Considerations
• SSH Access: If SSH access is not required, leave the KeyName parameter blank.
• Security Groups: Ensure that the WebServerSG only allows HTTP traffic from the ALB to prevent direct public access.
• Scaling Policies: Adjust the MinSize and MaxSize of the Auto Scaling Group based on expected traffic to optimize cost and performance.

Clean-Up:
To avoid ongoing charges, delete the CloudFormation stack after use:
1. In the CloudFormation console, select the stack.
2. Click Delete.
3. Confirm the deletion.