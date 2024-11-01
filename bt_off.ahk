#Requires AutoHotkey v2.0
#Warn
#SingleInstance Force
#include %A_ScriptDir%\cred_manager.ahk

param := A_Args[1]

; Extract the password property, assuming this holds the API key
APIkey := CredRead(param).password

; Set Device name
Device := "Dylan%27s%20Tab%20S8"

; Set optional command prefix
cmdPrefix := "Prefix=:="

; Set Var to the command and replace spaces with %20
Var := "btoff"

; Replace whitespace in Var (for URL encoding)
Var := RegExReplace(Var, "\s", "%20")

; Construct the URL with all variables
url := "https://joinjoaomgcd.appspot.com/_ah/api/messaging/v1/sendPush?deviceNames=" . Device . "&text=" . cmdPrefix . Var . "&apikey=" . APIkey

; Set up HTTP request with error handling
try {
    oHttp := ComObject("WinHttp.WinHttpRequest.5.1")
    oHttp.open("GET", url)
    oHttp.send()
} catch {
    MsgBox("Error: Failed to send request")
}

ExitApp
