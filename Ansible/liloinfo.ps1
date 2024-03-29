$logs = get-eventlog system -source Microsoft-Windows-Winlogon 
$res = @()
ForEach ($log in $logs) {
    if($log.instanceid -eq 7001) 
    {
        $type = "Logon"
    } 
    Elseif ($log.instanceid -eq 7002)
    {
        $type="Logoff"
    } 
    Else {Continue} 
$res += New-Object PSObject -Property @{Time = $log.TimeWritten; "Event" = $type; User = (New-Object System.Security.Principal.SecurityIdentifier $Log.ReplacementStrings[1]).Translate([System.Security.Principal.NTAccount])}
}
$res
