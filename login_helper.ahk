#Requires AutoHotkey v2.0
#SingleInstance force
#include %A_ScriptDir%\cred_manager.ahk

::ilogin::
{
	sendPass("work_email")
	Sleep(50)
	Send("{enter}")
	Sleep(2000)
	sendPass("work_password")
	Sleep(50)
	Send("{enter}")
	return
}

::itick::
{
	sendPass("email")
	Sleep(50)
	Send("{tab}")
	Sleep(50)
	sendPass("ticktick_password")
	Sleep(50)
	Send("{enter}")
	return
}