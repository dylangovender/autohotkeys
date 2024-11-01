#Requires AutoHotkey v2.0
#SingleInstance Force

deviceName := "WH-1000XM4"

DllCall("LoadLibrary", "str", "Bthprops.cpl", "ptr")

; Define BLUETOOTH_DEVICE_SEARCH_PARAMS as a binary buffer of the required size
BLUETOOTH_DEVICE_SEARCH_PARAMS := Buffer(24 + A_PtrSize * 2, 0)
NumPut("UInt", 24 + A_PtrSize * 2, BLUETOOTH_DEVICE_SEARCH_PARAMS, 0)  ; Set the struct size
NumPut("UInt", 1, BLUETOOTH_DEVICE_SEARCH_PARAMS, 4)  ; Set fReturnAuthenticated

; Define BLUETOOTH_DEVICE_INFO as a binary buffer
BLUETOOTH_DEVICE_INFO := Buffer(560, 0)
NumPut("UInt", 560, BLUETOOTH_DEVICE_INFO, 0)  ; Set the struct size

loop
{
    if (A_Index = 1) {
        foundedDevice := DllCall("Bthprops.cpl\BluetoothFindFirstDevice", "ptr", BLUETOOTH_DEVICE_SEARCH_PARAMS, "ptr", BLUETOOTH_DEVICE_INFO, "ptr")
        if !foundedDevice {
            MsgBox("No Bluetooth devices found")
            return
        }
    } else {
        if !DllCall("Bthprops.cpl\BluetoothFindNextDevice", "ptr", foundedDevice, "ptr", BLUETOOTH_DEVICE_INFO) {
            MsgBox("No more devices found")
            break
        }
    }
    
    ; Attempt to retrieve the device name as a fixed-length string (assuming WCHAR encoding)
    dev := StrGet(BLUETOOTH_DEVICE_INFO.Ptr + 64, 248 // 2, "UTF-16")  ; 248 bytes (124 WCHARs)
    
    if (dev = deviceName) {
        ; Define service GUIDs for Handsfree and AudioSink
        Handsfree := Buffer(16)
        DllCall("ole32\CLSIDFromString", "wstr", "{0000111e-0000-1000-8000-00805f9b34fb}", "ptr", Handsfree)
        AudioSink := Buffer(16)
        DllCall("ole32\CLSIDFromString", "wstr", "{0000110b-0000-1000-8000-00805f9b34fb}", "ptr", AudioSink)
        
        ; Disable the Handsfree and AudioSink services
        hr1 := DllCall("Bthprops.cpl\BluetoothSetServiceState", "ptr", 0, "ptr", BLUETOOTH_DEVICE_INFO, "ptr", Handsfree, "int", 0)
        hr2 := DllCall("Bthprops.cpl\BluetoothSetServiceState", "ptr", 0, "ptr", BLUETOOTH_DEVICE_INFO, "ptr", AudioSink, "int", 0)
        
        if (hr1 = 0) && (hr2 = 0) {
            break
        } else {
            ; Enable the Handsfree and AudioSink services
            ;hr1 := DllCall("Bthprops.cpl\BluetoothSetServiceState", "ptr", 0, "ptr", BLUETOOTH_DEVICE_INFO, "ptr", Handsfree, "int", 1)
            hr2 := DllCall("Bthprops.cpl\BluetoothSetServiceState", "ptr", 0, "ptr", BLUETOOTH_DEVICE_INFO, "ptr", AudioSink, "int", 1)
            break
        }
    }
}

DllCall("Bthprops.cpl\BluetoothFindDeviceClose", "ptr", foundedDevice)
ExitApp
