
#!/bin/bash
ami_id="ami-0bd2099338bc55e6d"
instance_type="t2.micro"
key_pair="first_key_test"
security_group="sg-0105f5a1543e3eef1" #ssh access only, output everywhere
#subnet_id="" # default VPC, Ok for now
instance_name="Launched-from-cli"
ebs_size="10" # GBs
echo "Launching"
# echo "ec2 run-instances --image-id "${ami_id}" --count 1 --instance-type "${instance_type}" --key-name "${key_pair}" --security-group-ids "${security_group}" --tag-specifications 'ResourceType=instance,Tags=[{Key=Name,Value="${instance_name}"}]'"
aws ec2 run-instances --image-id "${ami_id}" --count 1 --instance-type "${instance_type}" --key-name "${key_pair}" --security-group-ids "${security_group}" --tag-specifications 'ResourceType=instance,Tags=[{Key=Name,Value='"${instance_name}"'}]'

# with EBS mappings
#echo "ec2 run-instances --image-id "${ami_id}" --count 1 --instance-type "${instance_type}" --key-name "${key_pair}" --security-group-ids "${security_group}" --subnet-id "${subnet_id}" --block-device-mappings \"[{\"DeviceName\":\"/dev/sdf\",\"Ebs\":{\"VolumeSize\":"${ebs_size}",\"DeleteOnTermination\":true}}]\""


#### EXAMPLE OUTPUT/RETURN
# {
# "Groups": [],
# "Instances": [
#     {
#         "AmiLaunchIndex": 0,
#         "ImageId": "ami-0bd2099338bc55e6d",
#         "InstanceId": "i-0093a021f8fabb855",
#         "InstanceType": "t2.micro",
#         "KeyName": "first_key_test",
#         "LaunchTime": "2022-06-21T19:44:37+00:00",
#         "Monitoring": {
#             "State": "disabled"
#         },
#         "Placement": {
#             "AvailabilityZone": "eu-west-2b",
#             "GroupName": "",
#             "Tenancy": "default"
#         },
#         "PrivateDnsName": "ip-172-31-40-133.eu-west-2.compute.internal",
#         "PrivateIpAddress": "172.31.40.133",
#         "ProductCodes": [],
#         "PublicDnsName": "",
#         "State": {
#             "Code": 0,
#             "Name": "pending"
#         },
#         "StateTransitionReason": "",
#         "SubnetId": "subnet-0d067d9310b4f0c32",
#         "VpcId": "vpc-0685373c326255746",
#         "Architecture": "x86_64",
#         "BlockDeviceMappings": [],
#         "ClientToken": "1670fd89-d4af-4937-acab-fd7bb06f8665",
#         "EbsOptimized": false,
#         "EnaSupport": true,
#         "Hypervisor": "xen",
#         "NetworkInterfaces": [
#             {
#                 "Attachment": {
#                     "AttachTime": "2022-06-21T19:44:37+00:00",
#                     "AttachmentId": "eni-attach-039f7a4c88be81213",
#                     "DeleteOnTermination": true,
#                     "DeviceIndex": 0,
# :
#
#
