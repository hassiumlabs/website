#!/usr/bin/env bash
#
# Deployment of the website consists of sync'ing to an S3 bucket
#
# The master branch is considered the production copy and can be viewed at https://hassiumlabs.com
# The test branch is used to stage and test updates
# The S3 stored copy can be viewed at http://hassiumlabs-website.s3-website-us-west-2.amazonaws.com/test/site/
#

pip install --user awscli; export PATH=$PATH:$HOME/.local/bin

if [ "$TRAVIS_BRANCH" == "master" ]; then
  aws s3 sync public/ s3://hassiumlabs-website/production/site/ --delete
fi

if [ "$TRAVIS_BRANCH" == "test" ]; then
  aws s3 sync public/ s3://hassiumlabs-website/test/site/ --delete
fi
