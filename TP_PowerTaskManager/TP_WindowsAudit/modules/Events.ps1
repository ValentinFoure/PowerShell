$events = Get-WinEvent -LogName System -MaxEvents 20 | Where-Object {$_.LevelDisplayName -eq 'Error'}
$eventInfo = $events | Select-Object TimeCreated, Message

$eventInfo