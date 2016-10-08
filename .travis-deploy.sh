#!/usr/bin/env bash

pip install --user awscli; export PATH=$PATH:$HOME/.local/bin

if [ "$TRAVIS_BRANCH" == "master" ]; then
  aws s3 sync content/ s3://hassiumlabs-website/production/site/ --delete
fi

if [ "$TRAVIS_BRANCH" == "test" ]; then
  aws s3 sync content/ s3://hassiumlabs-website/test/site/ --delete
fi
