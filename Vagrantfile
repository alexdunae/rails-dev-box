# -*- mode: ruby -*-
# vi: set ft=ruby :
Vagrant.configure('2') do |config|
  config.vm.box      = 'ubuntu/trusty64'
  config.vm.hostname = 'ruby-fun'

  config.vm.network :forwarded_port, guest: 3000, host: 3000
  config.vm.network :forwarded_port, guest: 5000, host: 5000

  config.vm.provision :shell, path: 'bootstrap.sh', keep_color: true

  config.vm.provider 'virtualbox' do |v|
    v.memory = 4096
  end
end
