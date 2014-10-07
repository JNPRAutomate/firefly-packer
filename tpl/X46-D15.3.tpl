# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure('2') do |config|
  config.vm.box = 'juniper/ffp-12.1X46-D15.3'
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
end
