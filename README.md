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

# templates
- kali-template

Other templates are copied from their source repository at [gitlab.com](https://gitlab.com/badsectorlabs/ludus). 

I’ve at most updated ISO-urls and hashsums to get newer releases og fix broken templates.

# Tips & Tricks
- Create an extra config file to use when running commands that require the admin interface (through ssh tunneling)
- Create an alias for creating the SSH tunnel

``` powershell
function admintunnel { ssh -L 8081:127.0.0.1:8081 user@<Ludus IP> }
```