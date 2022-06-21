# awesome-aws


### Configure user, key, id, etc
```
aws configure
```


### Ubuntu Free AMIs
Ubuntu 20.04 server: `ami-0bd2099338bc55e6d`
Ubuntu 18.04 server: `ami-05a8c865b4de3b127`

### Free Tier EC2 instance in eu-west-2
* t2.micro: 1vCPU, 1GB RAM. 0.013 USD per hour

### Launch an instance
With a name-id `MyInstanceName` to help identify in e.g., console
```
aws ec2 run-instances --image-id "${ami_id}" --count 1 --instance-type "${instance_type}" --key-name "${key_pair}" --security-group-ids "${security_group}" --subnet-id "${subnet_id} --tag-specifications 'ResourceType=instance,Tags=[{Key=Name,Value=MyInstanceName}]'"
```

### Terminate an instance
Replace `terminate-instances` with `stop-instances` if only stopping is needed.
```
aws ec2 terminate-instances --instance-ids i-5203422c
```

### Add a block device to the image
When used with `run-instances`, example to provision a standard Amazon EBS volume that is 20 GB in size, and maps it to your instance using the identifier /dev/sdf:
```
--block-device-mappings "[{\"DeviceName\":\"/dev/sdf\",\"Ebs\":{\"VolumeSize\":20,\"DeleteOnTermination\":false}}]"
```

### Add a tag to the instance
```
aws ec2 create-tags --resources i-5203422c --tags Key=Name,Value=MyInstance
```

### List instances
* By type `t2.micro`, query instance id
```
aws ec2 describe-instances --filters "Name=instance-type,Values=t2.micro" --query "Reservations[].Instances[].InstanceId"
```
Returns ID:
[
    "i-05e998023d9c69f9a"
]

Query instance State (running, stopped, etc)
```
aws ec2 describe-instances --filters "Name=instance-type,Values=t2.micro" --query "Reservations[].Instances[].State[].Name"
```

* By tag `Name=MyInstance`:
```
aws ec2 describe-instances --filters "Name=tag:Name,Values=MyInstance"
```

* By AMI used to launch, e.g., `ami-x0123456,ami-y0123456,ami-z0123456`
```
aws ec2 describe-instances --filters "Name=image-id,Values=ami-x0123456,ami-y0123456,ami-z0123456"
```

### List public IP of instances
E.g., to ssh into it. Can be filtered by id or state
```
aws ec2 describe-instances \
  --query "Reservations[*].Instances[*].PublicIpAddress" \
  --output=text
```
