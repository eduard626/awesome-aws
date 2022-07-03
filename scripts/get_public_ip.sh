#!/bin/bash

#!/bin/bash
if [ "$#" -ne 1 ]; then
    echo "Need an instance id as input param"
else
  instance_id=$1
  if [[ $instance_id == i-* ]]; then   # True if $a starts with a "i-"
    echo "Requesting IP for $instance_id"
    aws ec2 describe-instances --instance-ids $instance_id --query 'Reservations[*].Instances[*].PublicIpAddress' --output text
  else
    echo "Wrong input format. Instance id should start with i- "
  fi
fi
