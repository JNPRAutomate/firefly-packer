#!/usr/bin/env bash

DOWNLOADDIR=images/download
OVADIR=images/fixedova
FIXESDIR=fixes
VMXDIR=images/vmx
# OSX OVFTOOL is in /Applications/VMware\ OVF\ Tool/ovftool
# ... or another /Applications folder inside VMware Fusion
OVFTOOL=ovftool
OVAPREFIX=junos-vsrx-12.1
OVASUFFIX=-domestic
VERSIONS="X46-D10.2
X46-D15.3
X46-D20.5
X46-D25.7
X47-D10.4
"

for v in $VERSIONS

do
    if test -f $DOWNLOADDIR/$OVAPREFIX$v$OVASUFFIX.ova;
      then
        echo -e "\n\n\033[32mProcessing $v:\033[0m";
        echo -e "\n\033[32mOpening $v:\033[0m";
        tar xvf $DOWNLOADDIR/$OVAPREFIX$v$OVASUFFIX.ova -C $OVADIR/$v;
        echo -e "\n\033[32mMoving $v ova:\033[0m";
        cp $FIXESDIR/$OVAPREFIX$v$OVASUFFIX* $OVADIR/$v;
        if test -f $OVADIR/$v/certchain.pem;
          then
            echo -e "\n\033[32mRemoving $v certs:\033[0m";
            rm -v $OVADIR/$v/certchain.pem $OVADIR/$v/$OVAPREFIX$v$OVASUFFIX.cert;
        fi
        echo -e "\n\033[32mVMware: Exporting .VMX $v:\033[0m";
        $OVFTOOL --overwrite --acceptAllEulas $OVADIR/$v/$OVAPREFIX$v$OVASUFFIX.ovf $VMXDIR/$v/$OVAPREFIX$v$OVASUFFIX.vmx;
        echo -e "\n\033[32mVirtualBox: Re-packaging .OVA $v:\033[0m";
        $OVFTOOL --overwrite $OVADIR/$v/$OVAPREFIX$v$OVASUFFIX.ovf $OVADIR/$OVAPREFIX$v$OVASUFFIX.ova;
    fi
done
