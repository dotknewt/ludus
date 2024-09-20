most roles are just copied from their source as listed in ludus.cloud documentation

# ludus_language_configuration
## Linux:
- configures the keyboard layout on linux hosts.

## Windows:
- configures the keyboard and/or display language
- role variables require a keyboard layout identifier found on https://learn.microsoft.com/en-us/windows-hardware/manufacture/desktop/windows-language-pack-default-values?view=windows-11#keyboard-identifiers

``` yaml
roles:
- ludus_language_configuration
role_vars: # these are the defaults if not set
    windows_display_language: '0409'
    windows_keyboard_language: '00000409'
    windows_username: 'localuser'
```

# ludus_kali_configuration
barebones role that installs additional kali tools nothing fancy in terms of role_vars etc.
