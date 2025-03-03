# Overview

## ludus-install-sliver
```yaml
    roles: # server
      - ludus-install-sliver
    role_vars:
      ludus_install_sliver:
        client: false
        server: true # only tested on debian12
        port: 443
        metasploit: true # requires role: ludus-install-metasploit
    
    roles: # client
      - ludus-install-sliver
    role_vars:
      ludus_install_sliver:
        client: true # only tested on kali-linux
        server: false
        port: 443
        metasploit: false
```
