# Read event log
param(
    [Parameter()] [string] $LogName,
    [Parameter()] [string] $searchstring,
    [Parameter()] [int] $MaxEvents
)

try {
        write-host "Looking for top $MaxEvents in the event log $LogName for the search criteria $searchstring ..."
        $slog = Get-WinEvent -LogName $LogName -MaxEvents $MaxEvents | select-object TimeCreated, Message | Where-Object {$_.message -like "*$searchstring*"} |format-table -AutoSize | Out-String
        if($slog)
        {
            write-host $slog
        }
        else {
            write-host "Search criteria $searchstring not found in the mentioned event log $LogName"
        }
        
}
catch {
    Write-Host "An error occurred:"
    Write-Host $_.Exception.Message
}
