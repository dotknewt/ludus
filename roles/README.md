## Linux:
- configures the keyboard layout
- configure xrdp and disable kasm

### To Do
- only remnux user works (on remnux) so user should be added to sudoers

## Windows:
- configures the keyboard and/or display language
  - keyboard/display language identifier found [learn.microsoft](https://learn.microsoft.com/en-us/windows-hardware/manufacture/desktop/windows-language-pack-default-values?view=windows-11#keyboard-identifiers)

## Example
``` yaml
ludus:
  - vm_name: «{{ range_id }}-kali»
    roles:
      - linux_config
    role_vars:
      linux_config:
        keyboard_layout: ‘no’
        rdp: ‘true’
        kali: ‘true’
        username: ‘kali’
        packages:
          - ‘neovim’

  - vm_name: «{{ range_id }}-flareVM»
    roles:
      - windows_config
    role_vars:
      windows_config:
        keyboard_layout: ‘00000414’
        display_language: ‘0409’
        username: ‘localuser’

```