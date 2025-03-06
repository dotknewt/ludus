foreach ( $role in $(Get-Childitem ../splunk/roles/condef-*)) { ludus ansible role add -d $role --user condef }
