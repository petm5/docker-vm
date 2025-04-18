#!/bin/sh

cleanup() {
  echo -e '{"execute": "qmp_capabilities"}\n{"execute": "system_powerdown"}' | socat - UNIX-CONNECT:/tmp/qemu_socket
  wait $pid
}

trap cleanup TERM

qemu-system-x86_64 \
  -nodefaults -display none \
  -serial stdio -machine graphics=off \
  -m $MEMORY \
  -cpu host -enable-kvm \
  -drive file=/storage/drive.qcow2,if=virtio \
  -nic user,model=virtio,$NET_OPTS \
  -qmp unix:/tmp/qemu_socket,server=on,wait=off \
  <&1 & pid=$!

wait $pid
