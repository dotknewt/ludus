# MALCOLM

proxmox host needs to run commands to allow promiscuous packet captures on bridged interface

`brctl setageing vmbr100[n] 0 # run once`

`ip link set vmbr100[n] promisc on # run once and following host reboot`
