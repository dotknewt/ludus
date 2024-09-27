Get-ChildItem "$Dest" -Recurse -Depth 1
    | Foreach-Object {
        if ( Test-Path -Path $_.FullName -PathType Container ) {
            echo $_.FullName
        }
    };
