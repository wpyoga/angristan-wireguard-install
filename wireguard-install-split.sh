#!/bin/bash

# Secure WireGuard server installer for Debian, Ubuntu, CentOS, Fedora and Arch Linux
# https://github.com/angristan/wireguard-install

RED='\033[0;31m'
ORANGE='\033[0;33m'
NC='\033[0m'

# @MERGE
. functions/system-checks.sh

# @MERGE
. functions/install-questions.sh

# @MERGE
. functions/install-wireguard.sh

# @MERGE
. functions/client.sh

# @MERGE
. functions/uninstall-wireguard.sh

# @MERGE
. functions/manage-menu.sh

# Check for root, virt, OS...
initialCheck

# Check if WireGuard is already installed and load params
if [[ -e /etc/wireguard/params ]]; then
	source /etc/wireguard/params
	manageMenu
else
	installWireGuard
fi
