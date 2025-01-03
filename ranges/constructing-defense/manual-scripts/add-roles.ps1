# random ps example
foreach ( $role in $(Get-Childitem ./role_*)) { ludus ansible role add -d $role --user CONDEF }