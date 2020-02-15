#!/bin/bash
packages=(python3-pip python3)
for package in ${packages[@]}
do
 dpkg-query --show $package &> /dev/null && \
 echo "${package} is installed" || \
 echo "${package} is nowhere to be found" 
done

