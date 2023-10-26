#Requires AutoHotkey v2.0
#SingleInstance force
#include %A_ScriptDir%\cred_manager.ahk

::awsuat:: aws-azure-login --profile uat

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

::ikr::
{
	Send("--")
	Send("{enter}")
	Send("Kind Regards")
	Send("{enter}")
	Send("Dylan Govender")
	return
}

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

#HotIf WinActive("ahk_exe warzone2100.exe", )
w::up
s::down
a::left
d::right
#HotIf ;