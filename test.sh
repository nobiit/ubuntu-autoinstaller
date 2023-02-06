#!/usr/bin/env bash
set -euo pipefail
set -x

if [ -z $(which multipass) ]; then
  sudo snap install multipass
fi

multipass launch --cloud-init user-data.yml -n primary 20.04
multipass shell
