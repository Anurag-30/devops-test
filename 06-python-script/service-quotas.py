import boto3

session = boto3.Session(profile_name='aft-target')
client = session.client('service-quotas')

#Enabling the Service Quota Template
response = client.associate_service_quota_template()

#Disabling the Service Quota Template
#response = client.disassociate_service_quota_template()

try:
    #Number of VPCs in one account from default 5 to 15
   response = client.put_service_quota_increase_request_into_template(
    QuotaCode='L-F678F1CE',
    ServiceCode='vpc',
    AwsRegion='us-west-2',
    DesiredValue=15
   )
   #Number of EC2 Running On-Demand Standard (A, C, D, H, I, M, R, T, Z) instances one account from default 35 to 100
   response = client.put_service_quota_increase_request_into_template(
    QuotaCode='L-1216C47A',
    ServiceCode='ec2',
    AwsRegion='us-west-2',
    DesiredValue=100
   )
   #Number of EBS Storage for General Purpose SSD (gp3) volumes, in TiB in one account from default 50 to 150
   response = client.put_service_quota_increase_request_into_template(
    QuotaCode='L-7A658B76',
    ServiceCode='ebs',
    AwsRegion='us-west-2',
    DesiredValue=150
   )
   #Number of RDS DB instances in one account from default 40 to 100
   response = client.put_service_quota_increase_request_into_template(
    QuotaCode='L-7B6409FD',
    ServiceCode='rds',
    AwsRegion='us-west-2',
    DesiredValue=100
   )
   #Number of RDS Parameter groups in one account from default 50 to 150
   response = client.put_service_quota_increase_request_into_template(
    QuotaCode='L-DE55804A',
    ServiceCode='rds',
    AwsRegion='us-west-2',
    DesiredValue=100
   )

except:
    print ("An error occured while processing the request")

#https://pythonexamples.org/python-list-of-dictionaries/
