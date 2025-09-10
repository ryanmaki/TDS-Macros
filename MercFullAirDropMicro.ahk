DllCall("SetProcessDPIAware")
#Requires AutoHotkey v2.0
#SingleInstance

; ---------------- CONFIG ----------------
coordsFile    := "coords.txt"
clickDelay    := 50         ; ms between clicks
keyTapDelay   := 60         ; ms between key taps (E/X)
upgradeCount  := 10         ; how many times to tap E
holdZMs       := 200        ; how long to hold Z (milliseconds)
exitCount     := 3          ; how many times to tap X at the end
placementPoint := { x: -1701, y: 707 }  ; where to place after pressing 5
; ----------------------------------------

coords := []


RunSequence() {
    global coords, placementPoint, keyTapDelay, upgradeCount, holdZMs, clickDelay, exitCount
    ; 0) presses 5 and place
    TapKey("5", 1, keyTapDelay)
    DoBypassClick(placementPoint, clickDelay)

    ; 1) spam E
    TapKey("e", upgradeCount, keyTapDelay)

    ; 2) holds Z to bypass detection
    HoldKey("z", holdZMs)

    ; 3) click through coords, i usually have 7 for air drop location and 2 clicks to force click riot
    Loop 7 {
        point := coords[A_Index]
        DoBypassClick(point, clickDelay)
    }

    ; 4) spam X
    TapKey("x", exitCount, keyTapDelay)
}


; --- loads coords from coords.txt or watever its called from top var ---
if FileExist(coordsFile) {
    Loop Read coordsFile {
        line := Trim(A_LoopReadLine)
        if (line = "" || SubStr(line, 1, 1) = ";")
            continue
        parts := StrSplit(line, ",")
        if (parts.Length = 2)
            coords.Push({x: parts[1] + 0, y: parts[2] + 0})
    }
} else {
    MsgBox("Could not find " coordsFile, "Error", 16)
    ExitApp()
}

; --- helpers!!!!!!!! ---
TapKey(key, n, delay) {
    Loop n {
        Send(key)          ; e.g., "e", "x", or "5"
        Sleep delay
    }
}

HoldKey(key, ms) {
    Send("{" key " down}") ; e.g., "z"
    Sleep ms
    Send("{" key " up}")
}

DoBypassClick(point, delayMs) {
    DllCall("SetCursorPos", "int", point.x, "int", point.y)
    Sleep 10
    MouseMove(0, 1, 0, "R")  ; tiny 1px nudge
    Sleep 10
    Click
    Sleep delayMs
}

; --- hotkey control to start sequence ---
XButton1::
{
    if (coords.Length < 3) {
        MsgBox("Need at least 3 coordinates in " coordsFile ". Found " coords.Length ".", "Error", 16)
        return
    }
    ; Repeat the whole sequence while XButton1 is held
    while GetKeyState("XButton1", "P") {
        RunSequence()
        ; optional tiny breather to avoid maxing CPU if your delays are very small
        Sleep 10
    }
}


; --- DEBUG: show loaded coordinates ---
F2::
{
    out := "Loaded coordinates:`n"
    for index, point in coords
        out .= index ": " point.x ", " point.y "`n"
    MsgBox(out)
}
