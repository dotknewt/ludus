# Role requirements
NB - "Global" roles are not used when building templates!

## List of wanted badsectorlabs roles
```
badsectorlabsRoles="ludus_adcs ludus_commandovm ludus_flarevm ludus_remnux ludus_emux ludus_elastic_agent ludus_elastic_container ludus_mssql ludus_vulhub ludus_bloodhound_ce"

for role in $badsectorlabsRoles; do # add each
    ludus ansible role add "badsectorlabs.$role"
done
```

## 