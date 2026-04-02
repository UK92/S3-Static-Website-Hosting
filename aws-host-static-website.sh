#!/bin/bash

if ! command -v aws &> /dev/null
then
    echo "AWS CLI could not be found. Please install it to proceed."
    exit
fi
aws --version
aws s3 mb s3://my-sample-static-website-urbee
aws s3 website s3://my-sample-static-website-urbee --index-document index.html --error-document error.html
aws s3 cp SampleWebPage.html s3://my-sample-static-website-urbee/index.html
aws s3 cp Error.html s3://my-sample-static-website-urbee/error.html 
echo "Static website hosted at: http://my-sample-static-website-urbee.s3-website-us-east-1.amazonaws.com" 
aws s3api put-bucket-policy --bucket my-sample-static-website-urbee --policy file://s3Bucket-allow.json
