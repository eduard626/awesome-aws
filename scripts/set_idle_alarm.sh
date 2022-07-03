#!/bin/bash

# Set an alarm for CPU utilization for an instance-id

# Get account id if needed
# aws sts get-caller-identity --query "Account" --output text

if [ "$#" -ne 1 ]; then
    echo "Need an instance id for alarm"
    exit 1
fi

# to identify alarm
alarm_name="Idle_CPU_alarm"
# threshold value in percentage for CPUUtilization
cpu_percent=10
# time in secs for considering idle
secs=600
# how many samples to consider action
periods=2
# alarm sns arn, should have been created previuosly. Can be recovered with list_sns_topics.sh
sns_arn="arn:aws:sns:eu-west-2:709075491513:EC2_CloudWatch_Alarms_RunInstances"
# stop action, also possible to terminate
arn_stop="arn:aws:automate:eu-west-2:ec2:stop"
# instance id for alarm
instance_id=$1
if [[ $instance_id == i-* ]]; then   # True if $a starts with a "i-"
  echo "Requesting alarm for $instance_id"
else
  echo "Wrong input format. Instance id should start with i- "
  exit 1
fi

aws cloudwatch put-metric-alarm --alarm-name $alarm_name\
 --alarm-description "Test Alarm when Avg CPU Utilization below $cpu_percent percent for $secs secs" \
 --metric-name CPUUtilization \
 --namespace AWS/EC2 \
 --statistic Average \
 --period $secs \
 --threshold $cpu_percent \
 --comparison-operator LessThanOrEqualToThreshold \
 --dimensions "Name=InstanceId,Value=${instance_id}" \
 --evaluation-periods $periods \
 --alarm-actions $sns_arn $arn_stop\
 --unit Percent
