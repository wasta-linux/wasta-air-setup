#!/bin/bash

# ==============================================================================
# wasta-air-setup-postinst.sh
#
# This script is automatically run by the postinst configure step on
#   installation of wasta-adobe-air.  It can be manually re-run, but is
#   only intended to be run at package installation.  
#
# 2016-09-16 rik: initial script
#
# ==============================================================================

# ------------------------------------------------------------------------------
# Check to ensure running as root
# ------------------------------------------------------------------------------
#   No fancy "double click" here because normal user should never need to run
if [ $(id -u) -ne 0 ]
then
	echo
	echo "You must run this script with sudo." >&2
	echo "Exiting...."
	sleep 5s
	exit 1
fi

# ------------------------------------------------------------------------------
# Main Processing
# ------------------------------------------------------------------------------

ARCH=$(uname -m)
if [ $ARCH = "x86_64" ];
then
    echo
    echo "*** 64bit detected: making necessary symlinks"
    echo
    ln -sf /usr/lib/x86_64-linux-gnu/libgnome-keyring.so.0 /usr/lib/libgnome-keyring.so.0
    ln -sf /usr/lib/x86_64-linux-gnu/libgnome-keyring.so.0.2.0 /usr/lib/libgnome-keyring.so.0.2.0
fi

# ------------------------------------------------------------------------------
# Finished
# ------------------------------------------------------------------------------
echo
echo "*** Finished with wasta-adobe-air-postinst.sh"
echo

exit 0
