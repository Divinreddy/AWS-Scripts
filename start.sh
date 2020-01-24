 #!/bin/bash
 # Start EC2 Single Instance
 # Prerequisite - instanceId script needs to be present before using this command
 # © Divin Reddy - www.divin.xyz
aws ec2 start-instances --instance-ids `sh instanceId.sh | grep "^i"`
