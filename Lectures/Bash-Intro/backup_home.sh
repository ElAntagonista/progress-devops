#! /usr/bin/env bash
set -o pipefail
set -o errexit
trap '_cleanup $?' EXIT 

username=$1
backup_dir=${2:-"/tmp/$username"}
curr_date=$(date +%F)
backup_path="${backup_dir}/${curr_date}-${username}.tar.gz"

_usage(){
  echo "Required arguments username"
  echo "Optional arguments backup_dir. Defaults to /tmp/<username>"
  echo "Example ./backup_home.sh ubuntu /tmp"
}


_check_args(){
	if [[ -z $username ]];then
    _usage
		exit 1
	fi
	if [[ "${backup_dir: -1}" == "/" ]];then
		backup_dir=${backup_dir:: -1}
	fi
}

function _backup(){
	test -d $backup_dir || mkdir -p $backup_dir

	tar czf $backup_path -C "/home/$username" .
}


function _cleanup(){	 
	echo $1
	if [[ "$1" -ne "0" ]];then
    rm -rf $backup_dir
		printf "%s\n" "Clean up on exit"
	fi
}

_check_args
_backup
