#! /bin/sh
set -x
ex_version="Ubuntu 20.04.1 LTS \n \l"
version=$(cat /etc/issue)
sourcelistPath="/etc/apt/source.list"
sources="cn.archive.ubuntu.com"
security="security.ubuntu.com"
goal_source="mirrors.aliyun.com"
if [ "${ex_version}" != "${version}" ] ;
then
	echo "Tiis linux version ${version}is not $ex_version"
	exit 
fi
echo -n "Are you want to change your apt source to ${goal_source} (yes or no)?"
read Arg
case $Arg in 
y|yes|Y|YES) 
	echo "STORE sources.list to sources.list.bak"
	cp /etc/apt/sources.list /etc/apt/sources.list.bak

	sed_command1="s#${sources}#${goal_source}#"
	sed_command2="s#${security}#${goal_source}#"
	sed -i "${sed_command1}" "${sourcelistPath}"  && sed -i "${sed_command2}" ${sourcelistPath}"

	apt-get update
	apt-get -y upgrade
	;;
*)
echo "nothing"
;;
esac
