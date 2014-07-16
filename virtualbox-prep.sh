#!/bin/bash

# replace with Thor commands that automagically fix the .OVFs, and updates the sha1sum in the .MF, etc.

tar xvf images/firefly/download/junos-vsrx-12.1X46-D10.2-domestic.ova -C images/firefly/fixedova/X46-D10.2
tar xvf images/firefly/download/junos-vsrx-12.1X46-D15.3-domestic.ova -C images/firefly/fixedova/X46-D15.3
tar xvf images/firefly/download/junos-vsrx-12.1X46-D20.5-domestic.ova -C images/firefly/fixedova/X46-D20.5
tar xvf images/firefly/download/junos-vsrx-12.1X47-D1.1-domestic.ova -C images/firefly/fixedova/X47-D1.1
tar xvf images/firefly/download/junos-vsrx-12.1X47-D2-domestic.ova -C images/firefly/fixedova/X47-D2
cp fixes/junos-vsrx-12.1X46-D10.2-domestic* images/firefly/fixedova/X46-D10.2
cp fixes/junos-vsrx-12.1X46-D15.3-domestic* images/firefly/fixedova/X46-D15.3
cp fixes/junos-vsrx-12.1X46-D20.5-domestic* images/firefly/fixedova/X46-D20.5
cp fixes/junos-vsrx-12.1X47-D1.1-domestic* images/firefly/fixedova/X47-D1.1
cp fixes/junos-vsrx-12.1X47-D2-domestic* images/firefly/fixedova/X47-D2
ovftool images/firefly/fixedova/X46-D10.2/junos-vsrx-12.1X46-D10.2-domestic.ovf images/firefly/fixedova/junos-vsrx-12.1X46-D10.2-domestic.ova
ovftool images/firefly/fixedova/X46-D15.3/junos-vsrx-12.1X46-D15.3-domestic.ovf images/firefly/fixedova/junos-vsrx-12.1X46-D15.3-domestic.ova
ovftool images/firefly/fixedova/X46-D20.5/junos-vsrx-12.1X46-D20.5-domestic.ovf images/firefly/fixedova/junos-vsrx-12.1X46-D20.5-domestic.ova
ovftool images/firefly/fixedova/X47-D1.1/junos-vsrx-12.1X47-D1.1-domestic.ovf images/firefly/fixedova/junos-vsrx-12.1X47-D1.1-domestic.ova
ovftool images/firefly/fixedova/X47-D2/junos-vsrx-12.1X47-D2-domestic.ovf images/firefly/fixedova/junos-vsrx-12.1X47-D2-domestic.ova
