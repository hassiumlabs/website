#!/usr/bin/env bash
#
# Publish local site content to Internet web site
#

# Sync with temp area on hassiumlabs.com server
rsync -avz --delete -e ssh content hldc:/tmp

# Sync from the temp area into the site web root
ssh hldc -C 'sudo rsync -avz --delete /tmp/content/ /var/www/hassiumlabs.com'
