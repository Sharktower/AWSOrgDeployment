#!/bin/bash -e
# https://github.com/tradichel/SecurityMetricsAutomation
# Org/stacks/Account/deploy_governance_accounts.sh
# author: @teriradichel @2ndsightlab
# Description: OrgRoot user deploys three governance accounts,
# Backup, and Root Sandbox account
##############################################################
source Org/stacks/Account/account_functions.sh

echo "You must have an AWS CLI profile named OrgRoot configured to run this script"
echo "-------------- Deploy Accounts -------------------"

#accounts are not created in the DenyAll OU by billing admin
#move from there to correct OU by governance admin
deploy_account_w_ou_name 'Billing' 'Governance'
deploy_account_w_ou_name 'IAMGovernance' 'Governance'

#Engineering OU
deploy_account_w_ou_name 'Sandbox' 'Engineering'
deploy_account_w_ou_name 'Dev' 'Engineering'
deploy_account_w_ou_name 'Test' 'Engineering'
deploy_account_w_ou_name 'Staging' 'Engineering'

#Critical Resources OU
deploy_account_w_ou_name 'KeysCerts' 'CriticalResources'
deploy_account_w_ou_name 'Domains' 'CriticalResources'
deploy_account_w_ou_name 'Secrets' 'CriticalResources'
deploy_account_w_ou_name 'Networking' 'CriticalResources'
deploy_account_w_ou_name 'ImagesContainers' 'CriticalResources'
deploy_account_w_ou_name 'Teleport' 'CriticalResources'

#Security OU
deploy_account_w_ou_name 'LogsMonitoring' 'Security'
deploy_account_w_ou_name 'IncidentResponse' 'Security'

#Backup OU
deploy_account_w_ou_name 'DataBackup' 'Backup'
deploy_account_w_ou_name 'LogArchive' 'Backup'
deploy_account_w_ou_name 'ArchivedAccounts' 'Backup'

#################################################################################
# Copyright Notice
# All Rights Reserved.
# All materials (the “Materials”) in this repository are protected by copyright 
# under U.S. Copyright laws and are the property of 2nd Sight Lab. They are provided 
# pursuant to a royalty free, perpetual license the person to whom they were presented 
# by 2nd Sight Lab and are solely for the training and education by 2nd Sight Lab.
#
# The Materials may not be copied, reproduced, distributed, offered for sale, published, 
# displayed, performed, modified, used to create derivative works, transmitted to 
# others, or used or exploited in any way, including, in whole or in part, as training 
# materials by or for any third party.
#
# The above copyright notice and this permission notice shall be included in all 
# copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, 
# INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A 
# PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT 
# HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION 
# OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE 
# SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
################################################################################ 

