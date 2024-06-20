# To get up and running

1. Clone repo into a folder on your drive
2. Create a task in Windows task scheduler to run the master_script.ahk at log-on using admin privs.
3. Reboot (or manually run the master_script.ahk as admin)

The master_script will start up a single AHK instance which links (via #Include) to the other AHK scripts in the folder. 
The "child" scripts are hardcoded in and you can remove the ones you feel are not necessary. 
This was done to reduce the number of running AHK instances (which clog up the system tray).

## Description of the scripts

1. General.ahk - Collection of general text replacements
2. cred_manager.ahk - Used to interface with the Windows credential manager to securely CRUD secrets
3. login_helper.ahk - Makes use of cred_manager to automatically paste in usernames and passwords in specific circumstances/scenarios
4. debug_helper.ahk - Hotkeys used to debug quicker (handy when you don't have access to an actual debugger)
5. linux.ahk - Short scripts specifically handy in a "Linux terminal"

## Using credentials/secrets

1. Details on how to use this are in cred_manager.ahk
2. NewpassGui() can be used to add credentials to Windows Credential Manager
3. sendPass() can be used to pull out those credentials into any AHK script

Add a new password (Ctrl + Alt + c)
Remove a password (Ctrl + Alt + d)
Fetch a password (Ctrl + Alt + r)