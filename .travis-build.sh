#!/usr/bin/env bash
#
# Compiling of the website is accomplished with Hugo (https://gohugo.io)
#

# Pull in the latest copy of the theme
git submodule update --remote --recursive

if [ "$TRAVIS_BRANCH" == "test" ]; then
  docker run \
    --rm \
    -v $(pwd):/srv/www \
    --workdir /srv/www \
    hassiumlabs/hugo --baseURL https://test.hassiumlabs.com
else
  docker run --rm -v $(pwd):/srv/www --workdir /srv/www hassiumlabs/hugo
fi
