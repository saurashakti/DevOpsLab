# Read event log
$slog = Get-WinEvent -LogName "Microsoft-Windows-PowerShell/Operational" -MaxEvents 10 | select-object TimeCreated, Message | Where-Object {$_.message -like "*console*"} |format-table -AutoSize | Out-String
write-host $slog