# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|

  config.vm.box = "robin/trusty64"
  config.vm.hostname = "docker"
  
  config.vm.network "forwarded_port", guest: 3142, host: 3142
  config.vm.provision "shell", inline: $shell
  
  if Vagrant.has_plugin?("vagrant-vbguest") then
  	config.vbguest.auto_update = false
  end

end

$shell = <<-CONTENTS
export DEBIAN_FRONTEND=noninteractive

apt-get update && apt-get install -y \
	curl

curl -sSL https://get.docker.com/ubuntu/ | sudo sh

chmod -x /etc/update-motd.d/*
echo "cd /vagrant" | tee -a \
	/root/.bashrc \
	/home/vagrant/.bashrc

CONTENTS