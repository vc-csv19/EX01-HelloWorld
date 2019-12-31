#!/usr/bin/env bash

set -eux

# Tested on Ubuntu 18.10.
# - https://superuser.com/questions/942657/how-to-test-arm-ubuntu-under-qemu-the-easiest-way
# - https://askubuntu.com/questions/797599/how-to-run-ubuntu-16-04-arm-in-qemu

# Parameters.
# This filename may need updating, check http://cdimage.ubuntu.com/releases/18.04/release/
id=ubuntu-18.04.3-server-arm64
location=/opt/vc-csv19-dev/
#id=debian-9.6.0-arm64-xfce-CD-1
img="${id}.img.qcow2"
img_snapshot="${id}.img.snapshot.qcow2"
flash0="${id}-flash0.img"
flash1="${id}-flash1.img"

# Run.
#
# cdrom must be scsi or else the installation fails midway with:
#
# > Detect and mount CD-ROM
# >
# > Your installation CD-ROM couldn't be mounted. This probably means
# > that the CD-ROM was not in the drive. If so you can insert it and try
# > again.
# >
# > Retry mounting the CD-ROM?
# > Your installation CD-ROM couldn't be mounted.
#
# This is because the drivers for the default virtio are not installed in the ISO,
# because in the past it was not reliable on qemu-system-aarch64.
#
# See also:
# https://bazaar.launchpad.net/~ubuntu-testcase/ubuntu-manual-tests/trunk/view/head:/testcases/image/1688_ARM64_Headless_KVM_Guest
qemu-system-aarch64 \
  -cpu cortex-a57 \
  -device rtl8139,netdev=net0 \
  -device virtio-scsi-device \
  -device scsi-cd,drive=cdrom \
  -device virtio-blk-device,drive=hd0 \
  -drive "if=none,file=${location}/${img_snapshot},id=hd0" \
  -m 2G \
  -machine virt \
  -netdev user,id=net0,hostfwd=tcp::5022-:22 \
  -nographic \
  -pflash "$location/$flash0" \
  -pflash "$location/$flash1" \
  -smp 2 \
;