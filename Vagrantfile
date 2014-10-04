Vagrant.configure('2') do |config|
  config.vm.box = "trusty64"
  config.vm.box_url = "../packer-vagrant/trusty64.box"

  config.vm.hostname = "docker.local"
  config.vm.network :forwarded_port, guest: 5000, host: 5000

  # Customize any of the virtual hardware settings here.
  config.vm.provider "virtualbox" do |vb|
    vb.gui = false
    vb.customize ["modifyvm", :id, "--cpus", 1]
    vb.customize ["modifyvm", :id, "--memory", 1024]
  end

  # Update apt lists to latest versions.
  config.vm.provision "shell", path: "shell/apt-update.sh"

  # Install Puppet modules into `modules`.
  config.vm.provision "shell", path: "shell/puppet-modules.sh"

  # Provision with puppet once complete with initial shell provisioners.
  config.vm.provision "puppet" do |puppet|
    # Fact to let Puppet know we're in Vagrant.
    puppet.facter = {
      "vagrant" => "1",
    }

    puppet.module_path = ["modules"]

    # Set verbose output for puppet, add "--debug" if you want even more.
    puppet.options = "--verbose --debug"
  end
end
