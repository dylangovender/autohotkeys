#Requires AutoHotkey v2.0
#SingleInstance Force

counter := 0  ; Initialize the counter

; ctrl+shift+0 - Reset counter
^+0::  
{
	Global counter 
	counter := 0  
	return
}

; ctrl+shift+1 - Logging.info 
^+1::
{
	Global counter 
	counter++
	Send("logging.info(`"" counter "`")")
	return
}

; ctrl+shift+2 - Logging.info with parameter
^+2::
{ 
	Send("logging.info(`"" A_Clipboard " : {{}{}}`".format(" A_Clipboard "))")
	return
}


