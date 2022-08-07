#!/bin/sh -e
#jobs/DeployBatchJobCredentials
#author: @teriradichel @2ndsightlab
assumerolearn="$1"
profile="$2"

if [ "$assumerolearn" == "" ]; then
  echo "Must enter an assumerole arn"
	exit
fi

if [ "$profile" == "" ]; then
  profile="default";
fi

echo "Profile: "$profile

job='DeployBatchJobCredentials'
policyname='BatchJobPolicy'$job
rolename="BatchJobRole"$job

echo $assumerolearn

#cd ../../batch_job_role/
#./deploy.sh $job $profile
#cd ../jobs/$job

echo "-------------- JOB ROLE -------------------"
aws cloudformation deploy \
    --profile $profile \
    --capabilities CAPABILITY_NAMED_IAM \
    --stack-name $rolename \
    --template-file cfn/role_batch_job.yaml \
    --parameter-overrides \
      jobnameparam=$job \
      assumerolearnparam=$assumerolearn

echo "-------------- POLICY -------------------"
aws cloudformation deploy \
    --profile $profile \
    --capabilities CAPABILITY_NAMED_IAM \
    --stack-name $policyname \
    --template-file cfn/policy_batch_job.yaml \
    --parameter-overrides \
        batchjobnameparam=$job

echo "-------------- CREDS -------------------"
aws cloudformation deploy \
    --profile $profile \
    --capabilities CAPABILITY_NAMED_IAM \
    --stack-name BatchJobAdminCredentials \
    --template-file cfn/access_key_batch_job_admin.yaml

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