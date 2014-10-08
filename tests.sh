#!/usr/bin/env bash

TEMPLATES=*.json

for t in $TEMPLATES
do
	echo -e "\e[1mValidating syntax-only for $t, until CI platform supports VMs\e[0m"
    packer validate -syntax-only $t
done
