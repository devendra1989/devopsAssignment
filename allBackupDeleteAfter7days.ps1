$Path = &quot;D:\Backups\&quot;
$DaysToKeep = &quot;-7&quot;
$CurrentDate = Get-Date
$DatetoDelete = $CurrentDate.AddDays($DaysToKeep)
Get-ChildItem $Path -Recurse | Where-Object { $_.LastWriteTime -lt $DatetoDelete } | Remove-Item -Recurse