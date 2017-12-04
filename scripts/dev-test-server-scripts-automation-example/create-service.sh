#!/bin/bash

if [[ $# -eq 0 ]] ; then
  echo "Usage: create-service.sh <ServiceName> <com.group.id>"
  exit 1
fi
servicename=$1
username=$1
if [ -z "$2" ]; then
  //empty
  groupid=TODO-set-groupid
else
  #Replace / with \/
  groupid="$(echo $2 |sed 's,\.,\\\/,g')"
  #groupid=$2
fi

echo Create User $username
if id "$username" >/dev/null 2>&1; then
  echo "User exists, not updating."
else
  sudo useradd -m $username
fi
[ec2-user@ip-10-30-1-158 ~]$ more create-service.sh 
#!/bin/bash

if [[ $# -eq 0 ]] ; then
  echo "Usage: create-service.sh <ServiceName> <com.group.id>"
  exit 1
fi
servicename=$1
username=$1
if [ -z "$2" ]; then
  //empty
  groupid=TODO-set-groupid
else
  #Replace / with \/
  groupid="$(echo $2 |sed 's,\.,\\\/,g')"
  #groupid=$2
fi

echo Create User $username
if id "$username" >/dev/null 2>&1; then
  echo "User exists, not updating."
else
  sudo useradd -m $username
fi


echo Create su_to_file
suToFile=su_to_$username.sh
if [ -e $suToFile ]; then
  echo "File $suToFile already exists. Not beeing updated."
else
  echo '#!/bin/bash' > $suToFile
  echo 'sudo su - '$username >> $suToFile
  chmod +x $suToFile
fi

echo Create start-service.sh
startServiceFile=/home/$username/start-service.sh
if [ -e $startServiceFile ]; then
  echo "File $startServiceFile already exists!"
else
  echo '#!/bin/bash' | sudo tee --append $startServiceFile
  echo 'nohup /usr/bin/java  -jar /home/'$username'/'$servicename'.jar' | sudo tee --append $startServiceFile &
  sudo chmod +x $startServiceFile
fi

echo Create update-service.sh
updateServiceFile=/home/$username/update-service.sh
if [ -e $updateServiceFile ]; then
  echo "File $updateServiceFile already exists!"
else
  curl -o tmp-update-service.sh https://raw.githubusercontent.com/Cantara/devops/master/scripted_deploy/update-service-template.sh
  sed -i 's/{artifact-id}/'$servicename'/g' tmp-update-service.sh
  sed -i 's/{group-id}/'$groupid'/g' tmp-update-service.sh
  sudo mv tmp-update-service.sh $updateServiceFile
  sudo chmod +x $updateServiceFile
fi

echo Set Ownership to files
sudo chown $username:$username $startServiceFile
sudo chown $username:$username $updateServiceFile

echo *****************************************************
echo ** Next steps:
echo ** 1. ./$suToFile
echo ** 2. ./update-service.sh
echo ** 3. ./start-service.sh
echo **
echo ** Well Done!
echo *****************************************************
