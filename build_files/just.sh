#!/usr/bin/bash

set -ouex pipefail

find /tmp/just -iname '*.just' -exec printf "\n\n" \; -exec cat {} \; >>/usr/share/ublue-os/just/70-custom.just
