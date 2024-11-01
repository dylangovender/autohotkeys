#Requires AutoHotkey v2.0
#SingleInstance force
#include %A_ScriptDir%\cred_manager.ahk

::iawsuat::aws-azure-login --profile uat
::iawsprod::aws-azure-login --profile prod

;Ctrl+1
^1::
{
	sendPass("pin")
	return
}


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
	api_variable := "AHK_s8_api_key"
	Run(A_ScriptDir "\bt_off.ahk " api_variable)
	Run(A_ScriptDir "\wh1000xm4_connect.ahk")
	return
}

;Pulls ID number from credential manager
^+!i::
{
	sendPass("id")
	return
}

;Pulls primary email from credential manager
::imail::
{
	sendPass("email")
	return
}

;Pulls work email from credential manager
::iwmail::
{
	sendPass("work_email")
}

;Email signature
::ikr::
{
	Send("--")
	Send("{enter}")
	Send("Kind Regards")
	Send("{enter}")
	Send("Dylan Govender")
	return
}

;Key remapping for warzone2100
#HotIf WinActive("ahk_exe warzone2100.exe", )
w::up
s::down
a::left
d::right
#HotIf ;