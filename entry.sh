#!/bin/sh

qemu-system-x86_64 \
  -nodefaults -display none \
  -serial stdio -machine graphics=off \
  -m $MEMORY \
  -cpu host -enable-kvm \
  -drive file=/storage/drive.qcow2,if=virtio \
  -nic user,model=virtio,hostfwd=tcp::22-:22,$NET_OPTS
