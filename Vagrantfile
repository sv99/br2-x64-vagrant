# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

UBUNTU_BOX = "ubuntu/trusty64"
# UBUNTU_BOX = "ubuntu/trusty32"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

  config.vm.box = UBUNTU_BOX

  # bridge the VM into the host machine's network
  # you'll be prompted to select a network adapter at startup
  # choose whichever one you use for your home network
  # config.vm.network "public_network"

  config.vm.provider :virtualbox do |v|
      v.memory = 2048
      v.cpus = 2
      v.customize ["modifyvm", :id, "--ioapic", "on"]
      # v.customize ["modifyvm", :id, "--cpuexecutioncap", "70"]
      # v.gui = true # debug
  end

  config.vm.hostname = "br2"

  config.vm.provision "shell", path: "prep_ubuntu.sh",
    keep_color: true

  # Uncomment if needed external access to the VM
  # config.vm.network "forwarded_port", guest: 22, host: 2022,
  #   auto_correct: true

  config.vm.provision "shell", path: "install_buildroot.sh",
    keep_color: true,
    privileged: false

end
