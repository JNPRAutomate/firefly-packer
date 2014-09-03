# -*- mode: ruby -*-
# vi: set ft=ruby :

# TODO: add plugin checks for netconf and jprovision
unless Vagrant.has_plugin?('vagrant-junos')
  fail "vagrant-junos is not installed!  Install with \'vagrant plugin install vagrant-junos\'"
end

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = 'juniper/ffp-12.1X46-D20.5'
  # Disable the default shared folder between the guest and host
  # Shared folders are not supported, since Junos doesn't support openvmtools
  # If removed, Vagrant will hang at the end of box instantiation
  # DO NOT REMOVE
  config.vm.synced_folder '.', '/vagrant', disabled: true
  # these boxes require now the vagrant-junos guest OS plugin
  # e.g. vagrant plugin install vagrant-junos
  config.vm.guest = :junos
  # changing default from Vagrant to root, since OS detection requires a shell
  # should continue to use Vagrant insecure default public key
  config.ssh.username = 'root'
  # use tcsh as login shell (as /bin/csh -l)
  # yes, it's really tcsh
  config.ssh.shell = 'csh -l'
  # adding in additonal NICs
  # The NICs will need to be provisioned manually within the VM.
  # To add additonal VMs into these networks use the same VM intnet names as defined. This is supported in virtualbox only.
  config.vm.network "private_network", ip: "0.0.0.0", auto_config: false, virtualbox__intnet: "net1"
  config.vm.network "private_network", ip: "0.0.0.0", auto_config: false, virtualbox__intnet: "net2"
  config.vm.network "private_network", ip: "0.0.0.0", auto_config: false, virtualbox__intnet: "net3"
  config.vm.network "private_network", ip: "0.0.0.0", auto_config: false, virtualbox__intnet: "net4"
  config.vm.network "private_network", ip: "0.0.0.0", auto_config: false, virtualbox__intnet: "net5"
  config.vm.network "private_network", ip: "0.0.0.0", auto_config: false, virtualbox__intnet: "net6"
  config.vm.network "private_network", ip: "0.0.0.0", auto_config: false, virtualbox__intnet: "net7"
end
