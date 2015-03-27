firefly-packer
==============
[![Build Status](https://travis-ci.org/JNPRAutomate/firefly-packer.svg)](https://travis-ci.org/JNPRAutomate/firefly-packer)

Packer scripts for building cloud-automatation-friendly [vSRX](http://www.juniper.net/us/en/products-services/security/srx-series/vsrx/) (aka Firefly Perimeter)  images

## Usage

Please see the [Packer documentation](http://www.packer.io/docs) if you plan on building these images yourself!

 1. Grab the latest [packer 0.7.5](https://packer.io/downloads.html) or newer.
 2. Clone this repo, e.g. `git clone https://github.com/JNPRAutomate/firefly-packer`
 3. Procure Firefly images, and place in `images/firefly/download` in the `firefly-packer` git directory
 4. Run the `image-prep.sh` script to prepare the images.
 4. Modify the templates for your environment, if desired
 5. `packer validate <templatename>` will validate the JSON templates provided.  If any of the source VMs, files, scripts, or automation inputs are missing, `validate` will tell you which ones (in addition to JSON syntax)
 6. `packer build <templatename>` will build the VMs for VMware and VirtualBox.  You need both installed, or you need to specify `-only virtualbox-ovf` or `-only vmware-vmx`
 7. The finished VM boxes will be placed in `builds/<provider>`

> **PROTIP:**

> Or... you can make use of the VMs at [Atlas](https://vagrantcloud.com/juniper)

## VMs

These [vSRX](http://www.juniper.net/us/en/products-services/security/srx-series/vsrx/) boxes are ___experimental___, but should work fine for all of your lab and testing needs.  They also serve as a preview of how OpenStack or VMware vSphere deployment tools could work (same Vagrant commands).


## VM Settings

Since these boxes are designed to use NAT networks with port forwarding for access, their administrative plane will not be exposed, unless you choose to expose it.  It is recommended that you change these defaults in exposed lab environments, or build your own VMs using the [firefly-packer project](https://github.com/JNPRAutomate/firefly-packer/) and [packer](http://packer.io).

- `root` password is set to `Juniper`
- `vagrant` account uses the [Vagrant project's insecure public key](https://github.com/mitchellh/vagrant/tree/master/keys), but will automatically change this to a unique key for your install.  You can also specify your own key, but since the key is auto-generated, we recommend using that
- a single interface is enabled, which maps to the default VMware or VirtualBox NAT network
- this interface is a member of the `functional-zone management`, with `host-inbound-traffic system services all` and `host-inbound-traffic protocols all` for ge-0/0/0.0

## Notes

- `vagrant plugin add vagrant-junos` will install a guest plugin for Junos
- `vagrant plugin add vagrant-host-shell` is a requirement for the
- The most common issues are centered around host and hypervisor issues:
  - disable or limit host firewall function to accommodate virtual networks and port forwarding
  - disconnect from VPNs, and have a good understanding of split tunneling and host routing, and how it affects VMs in your environment
  - `VBoxManage list vms` will show running VMs and orphans.  If you're using VirtualBox, it's recommended that you understand as much as possible about [VBoxManage](https://www.virtualbox.org/manual/ch08.html), since it will allow for further image + network configuration
  - If you're using VMware, `vmrun list` will list all running VMs, and it's recommended that you understand what `vmrun` commands are at your disposal

##Additional Documentation

- [Packer JSON Template breakdown](docs/JSON.md)

##Issues

Please open any issues on the [firefly-packer github issue tracker](https://github.com/JNPRAutomate/firefly-packer/issues).  Please make sure you've checked out the common issues before opening a ticket.

##TODO
Look into performance tuning options

Setting kern.hz in /boot/loader.conf. Currently set to 200, reducing latency it should be set to 1000. https://www.freebsd.org/doc/handbook/virtualization-guest.html

On VTY to Flowd: set i386 ft_sleep disable
