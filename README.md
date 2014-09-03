firefly-packer
==============
[![Build Status](https://travis-ci.org/JNPRAutomate/firefly-packer.svg)](https://travis-ci.org/JNPRAutomate/firefly-packer)

Packer scripts for building cloud-automatation-friendly [Firefly Perimeter](http://www.juniper.net/us/en/products-services/security/firefly-perimeter/)  images

## Usage

Please see the [Packer documentation](http://www.packer.io/docs) if you plan on building these images yourself!

 1. Install our packer fork for [Linux](https://s3-us-west-2.amazonaws.com/packerfork/linux/packer-jnprautomate-lin-current.zip) or [Mac OSX](https://s3-us-west-2.amazonaws.com/packerfork/osx/packer-jnprautomate-osx-current.zip).
 2. Clone this repo, e.g. `git clone https://github.com/JNPRAutomate/firefly-packer`
 3. Procure Firefly images, and place in `images/firefly/download` in the `firefly-packer` git directory
 4. Run the `image-prep.sh` script to prepare the images.  Ideally this will also download the source .OVA files in the future.
 4. Modify the templates for your environment, if desired
 5. Switch to the `./packer` sub-directory:
  5. `packer validate <templatename>` will validate the JSON templates provided.  If any of the source VMs, files, scripts, or automation inputs are missing, `validate` will tell you which ones (in addition to JSON syntax)
  6. `packer build <templatename>` will build the VMs for VMware and VirtualBox.  You need both installed, or you need to specify `-only <provider>`
  7. The finished VM boxes will be placed in `../builds/<provider>`

> **PROTIP:**

> Or... you can make use of the VMs at [Vagrant Cloud](https://vagrantcloud.com/juniper)

## VMs

These [Firefly Perimeter](http://www.juniper.net/us/en/products-services/security/firefly-perimeter/) boxes are experimental, but should work fine for all of your lab and testing needs.  They also serve as a preview of what how OpenStack or VMware vSphere deployment tools will work (same Vagrant commands)


## VM Settings

Since these boxes are designed to use NAT networks with port forwarding for access, their administrative plane will not be exposed, unless you choose to expose it.  It is recommended that you change these defaults in exposed lab environments, or build your own VMs using the [firefly-packer project](https://github.com/JNPRAutomate/firefly-packer/) and [packer](http://packer.io).

- `root` password is set to `Juniper`
- `vagrant` account uses the [Vagrant project's insecure public key](https://github.com/mitchellh/vagrant/tree/master/keys)
- a single interface is enabled, which maps to the default VMware or VirtualBox NAT network
- this interface is a member of the `security-zone untrust` (Firefly default), with `host-inbound-traffic` configured for management protocols
- yes, it might make sense to put `ge-0/0/0.0` in `functional-zone management` or even `security-zone trust`, but we're mirroring the Enterprise VM environment / cloud for now

## Notes

- These boxes will be greatly improved after Junos plugins are added to Vagrant core; it is recommended that you're on the latest release of [Vagrant](http://www.vagrantup.com/downloads.html) for your platform.
- In the meantime, shutdown boxes with `vagrant halt --force`
- The most common issues are centered around host and hypervisor issues:
  - disable or limit host firewall function to accommodate virtual networks and port forwarding
  - disconnect from VPNs, and have a good understanding of split tunneling and host routing, and how it affects VMs in your environment
  - `VBoxManage list vms` will show running VMs and orphans.  If you're using VirtualBox, it's recommended that you understand as much as possible about [VBoxManage](https://www.virtualbox.org/manual/ch08.html), since it will allow for further image + network configuration
  - If you're using VMware, `vmrun list` will list all running VMs, and it's recommended that you understand what `vmrun` commands are at your disposal

##Additional Documentation

- [Packer JSON Template breakdown](docs/JSON.md)

##Issues

Please open any issues on the [firefly-packer github issue tracker](https://github.com/JNPRAutomate/firefly-packer/issues).  Please make sure you've checked out the common issues before opening a ticket.
