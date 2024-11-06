# Required roles
Range deployments may require some roles. Roles can be globally available or installed pr. user

## Public
badsectorlabs.ludus_adcs
NocteDefensor.ludus_tailscale

## Local Directory
windows_language_configuration


# Additional badsectorlabs roles
```
badsectorlabsRoles="ludus_adcs ludus_commandovm ludus_flarevm ludus_remnux ludus_emux ludus_elastic_agent ludus_elastic_container ludus_mssql ludus_vulhub ludus_bloodhound_ce"

for role in $badsectorlabsRoles; do # add each
    ludus ansible role add "badsectorlabs.$role"
done
```

# Range Deployment

## Deploying only specific roles
```ludus range deploy -t user-defined-roles --only-roles NocteDefensor.ludus_tailscale --user XYZ```