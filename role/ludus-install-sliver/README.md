# ludus-install-sliver

# role_vars:

```yaml
ludus_install_sliver:
  server: false # pt. the role only works on debian where the user is named debian (path specification)
ludus_install_sliver:
  client: false # pt. the role only works on kali where the user is named kali (path specification)
ludus_install_sliver:
  port: 31337
ludus_install_sliver:
  metasploit: false # depends on role: ludus-install-metasploit
```

# example range definition
!!! the ludus-install-metasploit role must be available to the deploying user whenever the "metasploit:" key is used, even if value is "false"

##### thanks for testing!
- https://github.com/jessefmoore

```yaml

ludus:
  - vm_name: "{{ range_id }}-SLIVERCLIENT"
    hostname: "{{ range_id }}-SLIVERCLIENT"
    template: kali-x64-desktop-template
    vlan: 10
    ip_last_octet: 1
    ram_gb: 8
    cpus: 4
    testing:
      snapshot: true
      block_internet: true
    linux: true
    roles:
      - ludus-install-sliver
    role_vars:
      ludus_install_sliver:
        client: true
        metasploit: false

  - vm_name: "{{ range_id }}-SLIVERSERVER"
    hostname: "{{ range_id }}-SLIVERSERVER"
    template: debian-12-x64-server-template
    vlan: 10
    ip_last_octet: 2
    ram_gb: 8
    cpus: 4
    testing:
      snapshot: true
      block_internet: true
    linux: true
    roles:
      - ludus-install-sliver
    role_vars:
      ludus_install_sliver:
        server: true
        port: 443 # default: 31337
        metasploit: true
```
