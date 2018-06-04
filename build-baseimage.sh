#!/bin/bash

printf "Image Name: %s\n" $1

# Build Image
packer build -var-file=./variable.json \
             -var "custom_managed_image_name=$1" \
            ./bdm-baseimage.json 
