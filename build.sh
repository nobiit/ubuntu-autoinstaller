#!/usr/bin/env bash
set -euo pipefail
set -x

if [ -z $(which xorriso) ] || ! [ -d /usr/lib/ISOLINUX ]; then
  sudo apt-get -qq install xorriso isolinux
fi

if ! [ -f installer.iso ]; then
  curl -fsL -o installer.iso releases.ubuntu.com/focal/$(curl -sL releases.ubuntu.com/focal/SHA256SUMS | grep -oP '^.+ \*\K.+$' | grep -E "^ubuntu-[0-9.]+-live-server-$(dpkg --print-architecture).iso")
fi

curl -fsL raw.github.com/nobiit/ubuntu-autoinstall-generator/main/ubuntu-autoinstall-generator.sh | bash -s -- -a -k -s installer.iso -d auto-installer.iso -u user-data.yml
