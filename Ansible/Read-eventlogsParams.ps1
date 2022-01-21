# Read event log
# Parameter help description
param(
    [Parameter()] [string] $LogName,
    [Parameter()] [string] $searchstring,
    [Parameter()] [int] $MaxEvents
)

$ParameterName
#$slog = Get-WinEvent -LogName "Microsoft-Windows-PowerShell/Operational" -MaxEvents 10 | select-object TimeCreated, Message | Where-Object {$_.message -like "*console*"} |format-table -AutoSize | Out-String
Write-host "Calling parameters $logName $searchstring and $maxevents"
$slog = Get-WinEvent -LogName $LogName -MaxEvents $MaxEvents | select-object TimeCreated, Message | Where-Object {$_.message -like "*$searchstring*"} |format-table -AutoSize | Out-String
write-host $slog