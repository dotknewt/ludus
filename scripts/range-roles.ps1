# random ps example
foreach ( $role in $(Get-Childitem ./role*)) { ludus ansible role add -d $role --user CONDEF }