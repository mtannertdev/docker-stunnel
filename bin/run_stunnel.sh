#!/bin/bash

#
# Run the OpenVPN server normally
#

echo "Starting stunnel container"

echo "Starting stunnel server"

exec /usr/bin/stunnel /etc/stunnel/stunnel.conf
