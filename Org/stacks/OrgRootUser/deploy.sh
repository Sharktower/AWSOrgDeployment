#!/bin/bash -e
# https://github.com/tradichel/SecurityMetricsAutomation
# OrgRoot/stacks/OrgRootUser/deploy.sh
# author: @tradichel @2ndsightlab
# description: deploy the root user
##############################################################

#upload cfn/User.yaml into the root directory of a cloudshell session a new
#AWS account and run the following command:

aws cloudformation deploy --template-file cfn/User.yaml --stack-name ROOT-USER-OrgRoot --capabilities CAPABILITY_NAMED_IAM --profile proteusroot --region eu-west-2
