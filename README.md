## roles
### linux_config
- rdp
- keyboard
### windows_config
- keyboard
- language

# ranges
- ctf-range
- malware-range
 
## example-configs
- network
- defaults
- router

## /templates
Templates copied from Badsectorlabs' repository at [gitlab.com](https://gitlab.com/badsectorlabs/ludus). 
I may have modified things like more up to date Virtio drivers for windows, additional packages for kali, preseed files..

Add a role to the playbook file inside ansible/ where applicable
``` yaml
- hosts: all
  roles:
    - badsectorlabs.ludus_commandovm
    - windows_language_configuration
```

Or add the contents of "templates\custom-template-files\post-boot-config.yml" to a postboot config for linux hosts

# Tips & Tricks
- Create an extra config file to use when running commands that require the admin interface (through ssh tunneling)
- Create an alias for creating the SSH tunnel

``` shell 
# powershell
function admintunnel { ssh -L 8081:127.0.0.1:8081 user@<Ludus IP> }

# bash
alias admintunnel="ssh -L 8081:127.0.0.1:8081 user@<Ludus IP>"
```