#!/bin/bash

if ! command -v aws &> /dev/null
then
    echo "AWS CLI could not be found. Please install it to proceed."
    exit
fi
aws --version
aws s3 rb s3://my-sample-static-website-urbee --force
echo "Static website removed from: http://my-sample-static-website-urbee.s3-website-us-east-1.amazonaws.com"
