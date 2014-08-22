Packer JSON Template Example
==============
[![Build Status](https://travis-ci.org/JNPRAutomate/firefly-packer.svg)](https://travis-ci.org/JNPRAutomate/firefly-packer)

```json
{
  "builders": [
    {
      "boot_wait": "60s",
      "boot_command": [
        "root<enter><wait5>",
        "cli<enter><wait><wait>",
        "conf<enter><wait>",
        "set system services netconf ssh<enter><wait>",
        "set system root-authentication plain-text-password<enter><wait>",
        "Juniper<enter>Juniper<enter><wait>",
        "set system login user vagrant class super-user<enter><wait>",
        "set system login user vagrant authentication ssh-rsa \"ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAQEA6NF8iallvQVp22WDkTkyrtvp9eWW6A8YVr+kz4TjGYe7gHzIw+niNltGEFHzD8+v1I2YJ6oXevct1YeS0o9HZyN1Q9qgCgzUFtdOKLv6IedplqoPkcmF0aYet2PkEDo3MlTBckFXPITAMzF8dJSIFo9D8HfdOV0IAdx4O7PtixWKn5y2hMNG0zQPyUecp4pzC6kivAIhyfHilFR61RGL+GPXQ2MWZWFYbAGjyiYJnAmCP3NOTd0jMZEnDkbUvxhMmBYSdETk1rRgm+R4LOzFUGaHqHDLKLX+FIPKcF96hrucXzcWyLbIbEgE98OHlnVYCzRdK8jlqm8tehUc9c9WhQ== vagrant insecure public key\"<enter><wait10>",
        "set interfaces ge-0/0/0.0 family inet dhcp<enter><wait>",
        "set security zones security-zone untrust interfaces ge-0/0/0.0 host-inbound-traffic system-services ping<enter><wait>",
        "set security zones security-zone untrust interfaces ge-0/0/0.0 host-inbound-traffic system-services netconf<enter><wait>",
        "commit and-quit<enter><wait5>",
        "exit<enter><wait>"
      ],
      "type": "vmware-vmx",
      "source_path": "../images/firefly/vmx/X46-D20.5/junos-vsrx-12.1X46-D20.5-domestic.vmx",
      "ssh_username": "root",
      "ssh_password": "Juniper",
      "vnc_port_min": "5800",
      "vnc_port_max": "5900",
      "shutdown_command": "shutdown -p now",
      "vmx_data": {
        "ethernet0.connectionType": "nat"
      }
    },
```
- **`boot_wait`** - waits 60 seconds before pasting commands
- **`boot_command`** - *(Great docs are available at [Packer's website](http://www.packer.io/docs/builders/vmware-iso.html))*  Types a minimal amount of VNC commands for Vagrant and management protocols to be able to connect to the system.  This feature could also be great for building a minimum-viable "automatable" image for your organization, but templating and roles would be best handled upstream by [Vagrant](http://www.vagrantup.com), [Ruby's Netconf gem](https://github.com/Juniper/net-netconf), [Python's py-junos-ez-nc](https://github.com/Juniper/py-junos-eznc), [ansible-junos-stdlib](https://github.com/Juniper/ansible-junos-stdlib), etc. 
- **`type`** - the type of Packer builder, e.g. `vmware-vmx` or `virtualbox-ovf`
- **`source_path`** - the input file or URL
-  **`ssh_username`** and **`ssh_password`** - the username/password combo that Packer will use to SSH to the system.  Packer, Vagrant, SSH, or any other management tools cannot connect to a stock image until a password is set (as in the JSON `boot_command` as-above)
- **`vnc_port_min`** and **`vnc_port_max`** - a port-range for Packer to connect to the VMware console with the VNC protocol, which is used to "type" console commands.
- **`shutdown_command`** - this is the shutdown command used by Packer as the `ssh_username` to shut down the initial build, just before building the final box.  It is not what Vagrant will use during the normal lifecycle of a box, and is just relevant to the Packer build.
- **`vmx_data`** - `"ethernet0.connectionType": "nat"` is one example of setting .VMX file key:value pairs.  Other examples could be changing any other property of the VM.  It is recommended that this be handled by VM settings during the Vagrant phase, as modifying the .VMX directly can have unpredictable results
