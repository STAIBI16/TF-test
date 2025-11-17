#!/bin/bash
# Simple GCP post-install script

[ -f /root/.post-install.sh.flag ] && echo "postinstall already run" && exit 0

# Set hostname and FQDN
HOSTNAME=$(curl -s "http://metadata.google.internal/computeMetadata/v1/instance/hostname" -H "Metadata-Flavor: Google" | cut -d '.' -f1)
DOMAIN_NAME=$(curl -s "http://metadata.google.internal/computeMetadata/v1/instance/attributes/domain_name" -H "Metadata-Flavor: Google")
FQDN="${HOSTNAME}.${DOMAIN_NAME}"

echo "$HOSTNAME" >/etc/hostname
hostname "$HOSTNAME"
hostnamectl set-hostname "$HOSTNAME"

