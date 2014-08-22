#!/usr/bin/env bash

DOWNLOADDIR=images/firefly/download
OVADIR=images/firefly/fixedova
FIXESDIR=fixes
# OSX OVFTOOL is in /Applications/VMware\ OVF\ Tool/ovftool
# ... or another /Applications folder inside VMware Fusion
OVFTOOL=ovftool
OVAPREFIX=junos-vsrx-12.1
OVASUFFIX=-domestic
VERSIONS="X46-D10.2
X46-D20.5
"
PATCHEDVER=X46-D15.3

for v in $VERSIONS

do
	echo -e "\n\n\e[1mProcessing $v:\e[0m\n"
	tar xvf $DOWNLOADDIR/$OVAPREFIX$v$OVASUFFIX.ova -C $OVADIR/$v
	cp $FIXESDIR/$OVAPREFIX$v$OVASUFFIX* $OVADIR/$v
	$OVFTOOL $OVADIR/$v/$OVAPREFIX$v$OVASUFFIX.ovf $OVADIR/$OVAPREFIX$v$OVASUFFIX.ova
done

echo -e "\n\n\e[1mProcessing $PATCHEDVER:\e[0m\n"
tar xvf $DOWNLOADDIR/$OVAPREFIX$PATCHEDVER.b$OVASUFFIX.ova -C $OVADIR/$PATCHEDVER
cp $FIXESDIR/$OVAPREFIX$PATCHEDVER$OVASUFFIX* $OVADIR/$PATCHEDVER
$OVFTOOL $OVADIR/$PATCHEDVER/$OVAPREFIX$PATCHEDVER$OVASUFFIX.ovf $OVADIR/$OVAPREFIX$PATCHEDVER$OVASUFFIX.ova
