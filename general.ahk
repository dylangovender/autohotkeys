#Requires AutoHotkey v2.0
#SingleInstance force
#include %A_ScriptDir%\cred_manager.ahk

;Win+C
#/::
{
	Sleep(100)
	Send("^c")
    Sleep(100)
    Run(A_ClipBoard)
return
}

;Alt+C - For Microsoft Outlook - Open all emails with the same subject as the highlighted email
$!c::
{
	Send("+{F10},F,C")
	Sleep(1000)
	Send("{Right}")
	Sleep(1000)
	Send("^a")
	return
}

;Alt+S - For Microsoft Outlook - Open all emails with the same sender as the highlighted email
$!s::
{
	Send("+{F10},F,S")
	Sleep(1000)
	Send("{Right}")
	Sleep(1000)
	Send("^a")
	return
}

;Win+J - Open Bluetooth settings window
#J::
{
	Run("bthprops.cpl")
	return
}

;Pulls ID number from credential manager
::iiid::
{
	sendPass("id")
	return
}

::imail::
{
	sendPass("email")
	return
}

::iwmail::
{
	sendPass("work_email")
}

