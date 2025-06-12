#!/bin/bash

for stack in app/stacks/*/*; do
    echo "init $stack"
    cd $stack
    terraform init --upgrade
    cd ../../../..
done
