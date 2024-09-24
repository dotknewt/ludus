# to do
- role that takes variables to include other roles, i.e:
  - custom-config-vars: linux,rdp,kali,packages
  - src: https://docs.ansible.com/ansible/latest/playbook_guide/playbooks_variables.html#id25


linux_config:
  - rdp
  - keyboard

windows_config:
  - keyboard
  - language


## install packages from a list of variables
linux_packages:
  - git
  - curl
  - neovim
  - btop
  - ..

### kali packages
kali_packages: [true | false] 
   