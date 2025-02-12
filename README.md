# Roles

### Install all publicly available badsectorlabs' roles

```bash
# List was complete on sept 2024
badsectorlabsRolesGlobal="ludus_adcs ludus_elastic_agent ludus_elastic_container ludus_mssql ludus_vulhub ludus_bloodhound_ce"
badsectorlabsRolesLocal="ludus_commandovm ludus_flarevm ludus_remnux ludus_emux "

for role in $badsectorlabsRolesLocal; do # add each
    ludus ansible role add "badsectorlabs.$role"
done

for role in $badsectorlabsRolesGlobal; do # add each
    ludus ansible role add "badsectorlabs.$role -g"
done
```

## Local/custom roles

### roles/ludus-configure-language-windows

- configure keyboard layout and language

### role/ludus-install-sysmon

- downloads and installs sysmon tools to C:\SysmonFiles\

### role/ludus-install-sliver-server

- install sliver server and client on a debian host (debian defaults expected)

### role/ludus-install-sliver-client

- install sliver client on a debian host (kali defaults expected)

### role/ludus-install-remnux

- copy of badsectorlabs' role. hash frequently changes, so prefer using local version

## Install all roles in a directory

```powershell
foreach ( $role in $(Get-Childitem ./role/ludus-*)) { ludus ansible role add -d $role [[ --user [name]] -g ] }

```

```bash
# Assumes a roles directory
for DIR in $(ls ./role); do
    if [[ "$DIR" == "manual-setup-required" || "$DIR" == "README.md" ]]; then
        continue
    else
        echo "ludus templates add -d $DIR"
    fi
done
```

# Range Deployment

## Deploying only specific roles

`ludus range deploy -t user-defined-roles --only-roles NocteDefensor.ludus_tailscale --user XYZ`

# Ludus client configuration tricks

- Create an extra config file to use when running commands that require the admin interface (through ssh tunneling)
- Create an alias for creating the SSH tunnel

## Powershell Aliases

- start an admin tunnel for ludus user management

```powershell
function admintunnel { ssh -L 8081:127.0.0.1:8081 user@<Ludus IP> }
```

- create ludus user

```powershell
# Assumes an admin configuration file and having run `ludus apikey --config <adminconfig.yml>`
function addludususer($uname, $uid, $isAdmin) {
    ludus user add --name "$uname" --userid $uid $isAdmin --url https://127.0.0.1:8081 --config $HOME/.config/ludus/admin.yml
    }
```

- share an existing ludus range

```powershell
function shareludurange($targetUID, $sourceUID) {
    ludus range access grant --target "$targetUID" --source "$sourceUID"
    }
```

## Bash Aliases

```bash
alias admintunnel="ssh -L 8081:127.0.0.1:8081 user@<Ludus IP>"

sharerange () {
    range=$1
    user=$2
    ludus range access grant --target $range --source $user
}
```
