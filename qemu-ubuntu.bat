"C:\Program Files\qemu\qemu-system-aarch64"^
  -cpu cortex-a57^
  -device rtl8139,netdev=net0^
  -device virtio-scsi-device^
  -device virtio-blk-device,drive=hd0^
  -drive "if=none,file=C:\vc-csv19-dev\ubuntu-18.04.3-arm64.img.shrunk.qcow2,id=hd0"^
  -m 2G^
  -machine virt^
  -netdev user,id=net0,hostfwd=tcp::5022-:22^
  -nographic^
  -pflash "C:\vc-csv19-dev\ubuntu-18.04.3-arm64-flash0.img"^
  -pflash "C:\vc-csv19-dev\ubuntu-18.04.3-arm64-flash1.img"^
  -smp 2
