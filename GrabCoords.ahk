#NoEnv
#SingleInstance force
CoordMode, Mouse, Screen


; --- Record coords with Left Click ---
~LButton::
    MouseGetPos, xpos, ypos
    pos := xpos . "," . ypos
    ; Append to coords.txt in the script's folder
    FileAppend, %pos%`n, %A_ScriptDir%\coords.txt
    ToolTip, Saved: %pos%
    Sleep, 1000
    ToolTip
return

; --- Press Tab to exit the script ---
Tab::ExitApp
