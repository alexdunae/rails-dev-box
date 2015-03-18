# The output of all these installation steps is noisy. With this utility
# the progress report is nice and concise.
function install {
    echo installing $1
    shift
    apt-get -y install "$@" >/dev/null 2>&1
}

echo updating package information
apt-add-repository -y ppa:brightbox/ruby-ng >/dev/null 2>&1
apt-get -y update >/dev/null 2>&1

install 'development tools' build-essential

install Ruby ruby2.1 ruby2.1-dev rubygems rubygems1.8
update-alternatives --set ruby /usr/bin/ruby2.1 >/dev/null 2>&1
update-alternatives --set gem /usr/bin/gem2.1 >/dev/null 2>&1

install Git git
install SQLite sqlite3 libsqlite3-dev
install memcached memcached
install Redis redis-server

install PostgreSQL postgresql postgresql-contrib libpq-dev
sudo -u postgres createuser --superuser vagrant
sudo -u postgres createuser --superuser rails
sudo -u postgres createdb -O vagrant activerecord_unittest

install 'Nokogiri dependencies' libxml2 libxml2-dev libxslt1-dev
install 'Imagemagick dependencies' imagemagick libmagickwand-dev
install 'ExecJS runtime' nodejs

cat >/home/vagrant/.railsrc <<EOL
--skip-bundle
--database=postgresql
-m /vagrant/rails-template.rb
EOL

cat >/home/vagrant/.gemrc <<EOL
gem: --no-ri --no-rdoc
EOL

cp /vagrant/dotfiles/gitconfig /home/vagrant/.gitconfig
cp /vagrant/dotfiles/githelpers /home/vagrant/.githelpers
cp /vagrant/dotfiles/irbrc /home/vagrant/.irbrc
cp /vagrant/dotfiles/test_helper.rb /home/vagrant/.test_helper.rb

echo installing MinitestReporters
gem install minitest-reporters -N >/dev/null 2>&1

echo installing Bundler
gem install bundler -N >/dev/null 2>&1

echo installing Rails
gem install rails -N >/dev/null 2>&1

echo installing Heroku Toolbet
sudo wget -qO- https://toolbelt.heroku.com/install-ubuntu.sh | sh

# Needed for docs generation.
update-locale LANG=en_US.UTF-8 LANGUAGE=en_US.UTF-8 LC_ALL=en_US.UTF-8

echo 'all set, rock on!'
