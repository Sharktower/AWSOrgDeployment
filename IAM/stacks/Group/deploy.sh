#!/bin/bash -e
# https://github.com/tradichel/SecurityMetricsAutomation
# IAM/stacks/Groups/deploy.sh
# author: @teriradichel @2ndsightlab
# Description: Deploy all groups
##############################################################

echo "-------------- Deploy Groups -------------------"

source IAM/stacks/Group/group_functions.sh

deploy_group 'KMSAdmins'
deploy_group 'NetworkAdmins'
deploy_group 'SecurityMetricsOperators'
deploy_group 'AppDeployment'
deploy_group 'Developers'
deploy_group 'AppSec'

users='Developer,Developer2'
group='Developers'
add_users_to_group $users $group

users='KMSAdmin'
group='KMSAdmins'
add_users_to_group $users $group

users='NetworkAdmin'
group='NetworkAdmins'
add_users_to_group $users $group

users='SecurityMetricsOperator'
group='SecurityMetricsOperators'
add_users_to_group $users $group

users='Developer'
group='AppDeployment'
add_users_to_group $users $group

users='AppSec'
group='AppSec'
add_users_to_group $users $group

template="IAM/stacks/Group/cfn/GroupRunEC2FromConsolePolicy.yaml"
groupname="Developers"
policyname="GroupRunEC2FromConsolePolicy"
deploy_group_policy $groupname $template $policyname

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

