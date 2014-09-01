#!/usr/bin/env bash

DOWNLOADDIR=images/firefly/download
VMXDIR=images/firefly/vmx
VERSIONS="X44-D10.4
X46-D10.2
X46-D20.5
X47-D10.4
"

for v in $VERSIONS
do
	echo "Processing $v"
	ovftool --acceptAllEulas $DOWNLOADDIR/junos-vsrx-12.1$v-domestic.ova $VMXDIR/$v/junos-vsrx-$v-domestic.vmx
done

ovftool --acceptAllEulas images/firefly/download/junos-vsrx-12.1X46-D15.3.b-domestic.ova images/firefly/vmx/X46-D15.3/junos-vsrx-12.1X46-D15.3-domestic.vmx
