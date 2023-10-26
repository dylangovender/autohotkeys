#Requires AutoHotkey v2.0
#SingleInstance force

; Define a hotkey (Win+C) to trigger the script
#/::
{
	Sleep(100)
	Send("^c")
    Sleep(100)
    Run(A_ClipBoard)
return
}

