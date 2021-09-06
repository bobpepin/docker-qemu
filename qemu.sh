qemu-system-x86_64 -m 8G \
    -hda debian-docker.qcow2 \
    -hdb seed.iso \
    -nic user,smb="$HOME",hostfwd=::3022-:22 \
    "$@"
