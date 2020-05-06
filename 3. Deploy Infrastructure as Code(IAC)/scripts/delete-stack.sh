#!/bin/bash

aws cloudformation delete-stack \
--profile udacity \
--stack-name $1