#!/usr/bin/bash

set -ouex pipefail

RELEASE="$(rpm -E %fedora)"

rpm-ostree install onedrive

systemctl enable podman.socket

rpm-ostree kargs --append=mitigations=off
