* brew install qemu samba
* Get `debian-11-generic-amd64.qcow2` Debian cloud image from debian.org and save as `debian-docker.qcow2`
* Add your ssh public key to `cloud-init-data/user-data`
* Create cloud-init seed image by running `make-cloud-init-seed.sh`
* Use `qemu-img resize debian-docker.qcow2 128G` to resize the qcow2 image to 128G
* Boot into the image using `qemu.sh`
* Upon first boot, cloud-init will
  * Resize root partition and filesystem to max
  * Install docker.io and cifs-utils packages
  * Reboot and mount host home directory to /qemu using SMB
* You can connect to the guest by SSHing to port 3022 on localhost
