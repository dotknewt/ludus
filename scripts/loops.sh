#! /usr/bin/bash

# add templates from directories
for DIR in $(ls .); do
    if [[ "$DIR" == "manual-setup-required" || "$DIR" == "README.md" ]]; then
        continue
    else
        ludus templates add -d $DIR # -f
    fi
done

# remove all templates
templates=$(ludus templates list --json | jq -r 'to_entries[] | [.value.name] | @tsv')
for name in $templates
do
    ludus templates rm -n $name
done

# add roles from ansible-galaxy
standardbadsectorlabsRoles="ludus_adcs ludus_commandovm ludus_flarevm ludus_remnux" # standard
badsectorlabsRoles="
    ludus_adcs
    ludus_commandovm
    ludus_flarevm
    ludus_remnux
    ludus_emux
    ludus_elastic_agent
    ludus_elastic_container
    ludus_mssql
    ludus_vulhub
    ludus_bloodhound_ce"

for role in $badsectorlabsRoles; do # add each
    ludus ansible role add "badsectorlabs.$role"
done

# remove user roles
nonGlobalRoles=$(ludus ansible role list --json | jq -r '.[] | select(.Global|not) | .Name')
for role in $nonGlobalRoles; do
    ludus ansible role rm $role
done

# remove global roles
globalRoles=$(ludus ansible role list --json | jq -r '.[] | select(.Global) | .Name')
for role in $globalRoles; do
    ludus ansible role rm $role -g
done