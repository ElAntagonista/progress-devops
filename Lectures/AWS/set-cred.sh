#!/usr/bin/env bash

function remove_old_env(){
  aws_env=$(printenv | grep AWS_ | cut -d "=" -f 1)
  for x in $aws_env; do
    unset $x
  done
}


function set_env(){

access_key_id=$1
secret_key_id=$2

export AWS_DEFAULT_REGION=us-east-1
export AWS_SECRET_ACCESS_KEY=$secret_key_id
export AWS_ACCESS_KEY_ID=$access_key_id

}
