#!/bin/bash -e
# https://github.com/tradichel/SecurityMetricsAutomation/
# Org/stacks/IdP/deploy.sh
# author: @teriradichel @2ndsightlab
# description: Deploy AWS IAM IdP
##############################################################
source idp_functions.sh

echo "An CLI Profile named OrgRoot is required to run this code."
profile="IAM"

#create user specific secrets for developers
name="OktaIdP"

deploy_idp $name
