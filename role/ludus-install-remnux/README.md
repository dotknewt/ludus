# Ansible Role: REMnux ([Ludus](https://ludus.cloud))

An Ansible Role that installs [REMnux](https://remnux.org/) on Ubuntu 20.04 systems.

## NB: This role should probably only be used to create a remnux template!

## Requirements

You must have the ubuntu-20.04-x64-server-template built on your ludus host. You can add it with:

```
git clone https://gitlab.com/badsectorlabs/ludus.git
cd ludus/templates
ludus templates add -d ubuntu-20.04-x64-server
ludus templates build
```

## Role Variables

None.

## Dependencies

None.

## Example Playbook

```yaml
- hosts: remnux_hosts
  roles:
    - ludus-install-remnux
```

## License

GPLv3

## Author Information

This role was modified from the original created by [Bad Sector Labs](https://github.com/badsectorlabs), for [Ludus](https://ludus.cloud/).
