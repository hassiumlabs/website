#!/usr/bin/env bash
#
# Compiling of the website is accomplished with Hugo (https://gohugo.io)
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
