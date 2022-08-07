#!/bin/bash -e
#kms/deploy_kms_admin.sh
#author: @teriradichel @2ndsightlab
#pass in the arn of the aws identity that you want to allow to assume the kms admin role
assumerolearn="$1"
profile="$2"

if [ "$assumerolearn" == "" ]; then
  echo "You must provide an ARN of the identity that is allowed to assume the KMS admin role."
  exit
else
  echo "Assume role for role trust policy: "$assumerolearn
fi

if [ "$profile" == "" ]; then
  profile="default";
fi

kmsadminrolename="KmsAdminRole"
kmsadminpolicyname="KmsAdminPolicy"

echo "-------------- KMS ADMIN POLICY-------------------"
aws cloudformation deploy \
    --profile $profile \
    --capabilities CAPABILITY_NAMED_IAM \
    --stack-name $kmsadminpolicyname \
    --template-file cfn/policy_kms_admins.yaml

echo "-------------- KMS ADMIN -------------------"
aws cloudformation deploy \
    --profile $profile \
    --capabilities CAPABILITY_NAMED_IAM \
    --stack-name $kmsadminrolename \
    --template-file cfn/role_kms_administrator.yaml \
    --parameter-overrides assumerolearnparam=$assumerolearn



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