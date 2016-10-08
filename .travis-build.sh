#!/usr/bin/env bash
#
# Compiling of the website is accomplished with Hugo (https://gohugo.io)
# The master branch is considered the production copy and can be viewed at https://hassiumlabs.com
# The test branch is to stage and test updates
#   The CloudFront cached test version can be viewed at https://test.hassiumlabs.com
#   The S3 stored copy can be viewed at http://hassiumlabs-website.s3-website-us-west-2.amazonaws.com/test/site/
#

# Pull in the latest copy of the theme
git submodule update --init --remote --recursive

if [ "$TRAVIS_BRANCH" == "master" ]; then
  docker run --rm -v $(pwd):/srv/www --workdir /srv/www hassiumlabs/hugo
fi

if [ "$TRAVIS_BRANCH" == "test" ]; then
  docker run \
    --rm \
    -v $(pwd):/srv/www \
    --workdir /srv/www \
    hassiumlabs/hugo --baseURL  http://hassiumlabs-website.s3-website-us-west-2.amazonaws.com/test/site/
fi
