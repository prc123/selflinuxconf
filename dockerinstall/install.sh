#! /bin/bash
set -x
echo "Are you sure you want to install docker (yes/no/useDaocloud)?"
read arg
case $arg in
y|Y|yes|YES)
echo "start rm  docker"
sudo apt-get remove docker docker-engine docker.io containerd runc
sudo apt-get install \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg-agent \
    software-properties-common
curl -fsSL https://mirrors.ustc.edu.cn/docker-ce/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository \
   "deb [arch=amd64] https://mirrors.ustc.edu.cn/docker-ce/linux/ubuntu/ \
  $(lsb_release -cs) \
  stable"
sudo apt-get update
sudo apt-get install docker-ce docker-ce-cli containerd.io
;;
echo "docker install sucess"
useDaocloud)
curl -fsSL https://get.daocloud.io/docker | sh
*)
echo "nothing todo!"
esac

