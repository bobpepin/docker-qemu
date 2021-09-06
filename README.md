* brew install qemu samba
* Get `debian-11-generic-amd64.qcow2` Debian cloud image from debian.org and save as `debian-docker.qcow2`
* Add your ssh public key to `cloud-init-data/user-data`
* Create cloud-init seed image by running `make-cloud-init-seed.sh` or use the equivalent one-liner `hdiutil makehybrid -o seed.iso cloud-init-data -iso -joliet -default-volume-name cidata`
* Use `qemu-img resize debian-docker.qcow2 128G` to resize the qcow2 image to 128G
* Boot into the image using `qemu.sh`, or use the equivalent one-liner `qemu-system-x86_64 -m 8G -hda debian-docker.qcow2 -hdb seed.iso -nic user,smb="$HOME",hostfwd=::3022-:22`
* Upon first boot, cloud-init will
  * Resize root partition and filesystem to max
  * Install docker.io and cifs-utils packages
  * Reboot and mount host home directory to /qemu using SMB
* You can connect to the guest by SSHing to port 3022 on localhost
