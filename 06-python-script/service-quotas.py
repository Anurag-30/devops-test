import boto3

session = boto3.Session(profile_name='anurag-test')
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
   

except:
    print ("An error occured while processing the request")

#https://pythonexamples.org/python-list-of-dictionaries/
