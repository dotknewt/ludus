# ludus-install-sliver

# role_vars:

``` yaml
ludus_install_sliver_server: false
ludus_install_sliver_server: false
ludus_install_sliver_port: 31337
ludus_install_metasploit: true # depends on role: ludus-install-metasploit
```

# example vm definitions

``` yaml
  - vm_name: "{{ range_id }}-sliver-server1"
    hostname: "{{ range_id }}-sliver-server1"
    template: debian-latest-server-template
    vlan: 200
    ip_last_octet: 1
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
        port: 12345

  - vm_name: "{{ range_id }}-sliver-client"
    hostname: "{{ range_id }}-sliver-client"
    template: kali-custom-desktop-template
    vlan: 200
    ip_last_octet: 2
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

  - vm_name: "{{ range_id }}-metasploit"
    hostname: "{{ range_id }}-metasploit"
    template: debian-latest-server-template
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
    template: debian-latest-server-template
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