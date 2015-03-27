tpl directory
=============
[![Build Status](https://travis-ci.org/JNPRAutomate/firefly-packer.svg)](https://travis-ci.org/JNPRAutomate/firefly-packer)

- .tpl files are used to place invisible Vagrantfile settings in the artifact created by the Packer build
- you won't see these in a Vagrantfile after downloading a box; they're stored in ~/.vagrant.d
- these can be overridden in a user's Vagrantfile
