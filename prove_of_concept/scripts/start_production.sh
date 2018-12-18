#!/bin/bash

# start rails server in production mode
echo "# Set params in game.rb #"
read -p "Press enter when ready"
echo "# Installing gems #"
RAILS_ENV=production bundle install
echo "# Create db #"
RAILS_ENV=production rake db:create
echo "# Migrate db #"
RAILS_ENV=production rake db:migrate
echo "# Precompile assets #"
RAILS_ENV=production bundle exec rake assets:precompile

IPADDRESS=`ifconfig en0 | grep -Eo 'inet (addr:)?([0-9]*\.){3}[0-9]*' | grep -Eo '([0-9]*\.){3}[0-9]*' | grep -v '127.0.0.1'`

echo "# Start server #"
echo "#########################"
echo "### ${IPADDRESS}:3000 ###"
echo "#########################"
RAILS_ENV=production rails s
