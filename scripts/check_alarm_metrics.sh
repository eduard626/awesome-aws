#!/bin/bash

# Check metrics available for EC2 instances. 
aws cloudwatch list-metrics --namespace "AWS/EC2"
