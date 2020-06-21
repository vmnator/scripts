$argument = "-Command `"& C:\Windows\Setup\Scripts\VMNator.ps1"
$action = New-ScheduledTaskAction -Execute 'PowerShell.exe' -Argument $argument
$principal = New-ScheduledTaskPrincipal -GroupId "BUILTIN\Users" -RunLevel Highest
$trigger = New-ScheduledTaskTrigger -AtLogOn
$task = New-ScheduledTask -Action $action -Principal $principal -Trigger $trigger 
Register-ScheduledTask "ExampleTask" -InputObject $task -Force