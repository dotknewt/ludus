# Ansible Role: Flare VM ([Ludus](https://ludus.cloud))

An Ansible Role that installs [Flare VM](https://github.com/mandiant/flare-vm) on Windows >= 10 hosts.

Uses code from [privacy.sexy](https://privacy.sexy) to disable Defender and Tamper Protection.

## Requirements

- Windows >= 10
- Powershell >= 5
- at least 60GB free disk
- at least 2GB RAM
- Usernames without spaces or other special characters
- Internet connection

## Role Variables

    # Disable the red/green dynamic Ludus wallpaper in favor of the static flarevm wallpaper
    ludus_flarevm_use_flarevm_wallpaper: true

## Dependencies

None.

## Known issues

Check the [Daily Failures](https://github.com/mandiant/VM-Packages/wiki/Daily-Failures) page for known issues with flarevm packages on different operating systems.

Other issues:
- `DotNet3.5` fails to install on Windows 11 22H2.

## Example Playbook

```yaml
- hosts: flarevm_hosts
  roles:
    - badsectorlabs.ludus_flarevm
```

## Example Ludus Range Config

```yaml
ludus:
  - vm_name: "{{ range_id }}-flare"
    hostname: "{{ range_id }}-FLARE"
    template: win11-22h2-x64-enterprise-template
    vlan: 99
    ip_last_octet: 2
    ram_gb: 8
    cpus: 4
    windows:
      install_additional_tools: true
    roles:
      - badsectorlabs.ludus_flarevm
```

## License

GPLv3

## Author Information

This role was created by [Bad Sector Labs](https://github.com/badsectorlabs), for [Ludus](https://ludus.cloud/).
