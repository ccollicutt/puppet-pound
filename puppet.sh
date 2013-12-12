export DEBIAN_FRONTEND=noninteractive
apt-get update && apt-get install -y vim wget curl git

wget http://apt.puppetlabs.com/puppetlabs-release-precise.deb
dpkg -i puppetlabs-release-precise.deb
apt-get update

###########################################
#
# Install uby
# - From http://leonard.io/blog/2012/05/installing-ruby-1-9-3-on-ubuntu-12-04-precise-pengolin/ 
#

sudo apt-get install -y ruby1.9.1 ruby1.9.1-dev \
  rubygems1.9.1 irb1.9.1 ri1.9.1 rdoc1.9.1 \
  build-essential libopenssl-ruby1.9.1 libssl-dev zlib1g-dev

sudo update-alternatives --install /usr/bin/ruby ruby /usr/bin/ruby1.9.1 400 \
         --slave   /usr/share/man/man1/ruby.1.gz ruby.1.gz \
                        /usr/share/man/man1/ruby1.9.1.1.gz \
        --slave   /usr/bin/ri ri /usr/bin/ri1.9.1 \
        --slave   /usr/bin/irb irb /usr/bin/irb1.9.1 \
        --slave   /usr/bin/rdoc rdoc /usr/bin/rdoc1.9.1

sudo update-alternatives --config ruby
sudo update-alternatives --config gem

#
# End install ruby
# 
###########################################

sudo gem install rmate
sudo apt-get install -y puppet

# Vagrant sets up it's own path which includes puppet 2.7.x which I don't want
sudo rm -f /etc/profile.d/vagrant_ruby.sh



