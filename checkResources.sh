#!/bin/bash

# Set your AWS region
regions=$(aws ec2 describe-regions --query 'Regions[].RegionName' --output text)

# Loop through each regions
for region in $regions; do

    echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
    echo "Region is : $region"
    echo " "

    # Get the Default VPC ID
    # vpcId=$(aws ec2 describe-vpcs --filters 'Name=is-default,Values=true' --query 'Vpcs[].VpcId' --region $region --output text)

    # List of instance with their state
    echo "List of instances..."
    aws ec2 describe-instances --region $region --query "Reservations[].Instances[?State.Name != 'terminated' && State.Name != 'shutting-down'].[InstanceId, State.Name]" --output table; echo

    # List of EBS volumes
    echo "List of Volumes..."
    aws ec2 describe-volumes --region $region --query "Volumes[].[VolumeId, State]" --output table; echo

    # List of Snapshots
    echo "List of snapshots..."
    aws ec2 describe-snapshots --region $region --owner-ids self --query "Snapshots[].[SnapshotId, State]" --output table; echo

    # List of AMIs
    echo "List of AMI..."
    aws ec2 describe-images --region $region --owners self --query "Images[].[ImageId, State]" --output table; echo

    # List of non-default security group 
    echo "List of non-default SG..."
    aws ec2 describe-security-groups --region $region --query "SecurityGroups[?GroupName != 'default'].[GroupName]" --output table; echo

    # List of EIP
    echo "List of EIP..."
    aws ec2 describe-addresses --region $region --query "Addresses[].[PublicIp]" --output table; echo

    # List of Capacity reservation
    echo "List of Capacity Reservations..."
    aws ec2 describe-capacity-reservations --region $region --query "CapacityReservations[].[CapacityReservationId, State]" --output table; echo

    # List of Dedicated host
    echo "List of Dedicated Hosts..."
    aws ec2 describe-hosts --region $region --query "Hosts[].[HostId, State]" --output table; echo
    echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~";
    echo " ";

done
