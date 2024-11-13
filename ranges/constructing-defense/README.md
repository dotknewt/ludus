# MALCOLM
proxmox host needs to run commands to allow promiscuous packet captures on bridged interface

brctl setageing vmbr100[n] 0

ip link set vmbr100[n] promisc on