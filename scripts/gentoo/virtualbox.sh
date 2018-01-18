#!/bin/bash

emerge sys-apps/dmidecode

# Bail if we are not running inside VirtualBox.
if [[ `dmidecode -s system-product-name` != "VirtualBox" ]]; then
    exit 0
fi

# Install VirtualBox from portage
# echo "app-emulation/virtualbox-guest-additions ~amd64" > /etc/portage/package.accept_keywords/virtualbox
emerge app-emulation/virtualbox-guest-additions

rc-update add virtualbox-guest-additions default
rc-service virtualbox-guest-additions start
# systemctl enable virtualbox-guest-additions.service
# systemctl start virtualbox-guest-additions.service
