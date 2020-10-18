#!/usr/bin/env bash 

#Nice to have
set -o errexit # Exit the script on error
set -o pipefail # Do not allow failure on piping 


trap "echo Bye" SIGTERM

function say_bye(){
  echo "Bye"
}

function _variable_declaration(){
    var1="some_value"

    declare -r var2=3

    # Array
    arr=(1 2 3 4 5)

    # append
    arr+=(6)

    # get all values from array
    arr_values=${arr[@]}

    printf "%s\n" $var1 $var2 ${arr[*]}
}


function _parameter_expansion(){
  Variable="Some string"
  echo ${Variable} # => Some string
  # This is a simple usage of parameter expansion
  # Parameter Expansion gets a value from a variable.
  # It "expands" or prints the value
  # During the expansion time the value or parameter can be modified
  # Below are other modifications that add onto this expansion

  # String substitution in variables
  echo ${Variable/Some/A} # => A string
  # This will substitute the first occurrence of "Some" with "A"

  # Substring from a variable
  Length=7
  echo ${Variable:0:Length} # => Some st
  # This will return only the first 7 characters of the value
  echo ${Variable: -5} # => tring
  # This will return the last 5 characters (note the space before -5)

  # String length
  echo ${#Variable} # => 11

  # Default value for variable
  echo ${Foo:-"DefaultValueIfFooIsMissingOrEmpty"}
  # => DefaultValueIfFooIsMissingOrEmpty
  # This works for null (Foo=) and empty string (Foo=""); zero (Foo=0) returns 0.
  # Note that it only returns default value and doesn't change variable value.
}


function _pipefail(){
  a=$(exit 1 | true && echo "hi")
  echo $a
}


# Aliases
function _aliases(){
  alias l="ls -la"
}

# Printf 
function _say_bye(){
  printf "%s\n" "Good" "Bye" "From" "Me"
}

# Incrementing a number
function _incrementer(){
i=$1
while [ true ]; do
  ((i++))
  printf "%d\n" $i
  sleep 5
done
}
_incrementer 2	

# Read from file
function _read_file(){
  while IFS= read -r line
  do
    echo "$line"
  done < /proc/net/dev
}


# Write to file
## HERE doc
function _here_doc(){
cat > test.py <<EOF
import os
print(os.getcwd())
EOF
}


function _argument_parsing(){
case "$1" in
  "development")
    echo "Dev"
  ;;
  "production")
    echo "Prod"
  ;;

  *)
    echo "Usage: $0 [production|development]"
esac
}


# subshelling 
function _subshelling(){
  for n in {1..15};do
    (echo $n; sleep 3) &
  done
  wait
}


# sourcing
function _helpful_vars(){
  # Set magic variables for current file & dir
  __dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
  __file="${__dir}/$(basename "${BASH_SOURCE[0]}")"
  __base="$(basename ${__file} .sh)"
  printf "Dir - %s\nFile - %s\nBase - %s"  $__dir $__file $__base
}


# redirection

