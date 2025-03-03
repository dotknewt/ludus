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
  - vm_name: "{{ range_id }}-SLIVER"
    hostname: "{{ range_id }}-SLIVER"
    template: debian-12-x64-server-template
    vlan: 10
    ip_last_octet: 100
    ram_gb: 8
    cpus: 4
    linux: true
    testing:
      snapshot: false
      block_internet: false
    roles:
      - ludus-install-sliver
    role_vars:
      ludus_install_sliver:
        server: true
        metasploit: true
        port: 1884

  - vm_name: "{{ range_id }}-KALI"
    hostname: "{{ range_id }}-KALI"
    template: kali-x64-desktop-template
    vlan: 10
    ip_last_octet: 200
    ram_gb: 8
    cpus: 4
    linux: true
    testing:
      snapshot: false
      block_internet: false
    roles:
      - ludus-install-sliver
    role_vars:
      ludus_install_sliver:
        client: true

  - vm_name: "{{ range_id }}-metasploit"
    hostname: "{{ range_id }}-metasploit"
    template: debian-12-x64-server-template
    vlan: 200
    ip_last_octet: 3
    ram_gb: 16
    cpus: 8
    testing:
      snapshot: true
      block_internet: true
    linux: true
    roles:
      - ludus-install-sliver
    role_vars:
      ludus_install_sliver:
        client: true
        metasploit: true

  - vm_name: "{{ range_id }}-sliver-server2"
    hostname: "{{ range_id }}-sliver-server2"
    template: debian-12-x64-server-template
    vlan: 200
    ip_last_octet: 4
    ram_gb: 16
    cpus: 8
    testing:
      snapshot: true
      block_internet: true
    linux: true
    roles:
      - ludus-install-sliver
    role_vars:
      ludus_install_sliver:
        server: true
        metasploit: true # depends on role: ludus-install-metasploit

```
