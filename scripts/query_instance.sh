#!/bin/bash
if [ "$#" -ne 1 ]; then
    echo "Need an instance id as input param"
else
  instance_id=$1
  if [[ $instance_id == i-* ]]; then   # True if $a starts with a "i-"
    echo "Requesting info for $instance_id"
    aws ec2 describe-instances --instance-ids $instance_id
  else
    echo "Wrong input format. Instance id should start with i- "
  fi
fi
