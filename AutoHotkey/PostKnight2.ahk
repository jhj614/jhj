#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.

; Makes a script unconditionally use its own folder as its working directory.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

; Ensures that there is only a single instance of this script running.
#SingleInstance, Force

vWin := "dt02-01"

WinActivate, %vWin%

; Mouse positions
; GO button
vGOx := 400
vGOy := 580

vDashButtonX := 143
vDashButtonY := 1145

vShieldButtonX := 356
vShieldButtonY := 1145

vPotionButtonX := 573
vPotionButtonY := 1145

vTickButtonX := 363
vTickButtonY := 1233

; 1st Pane
vP1x := 240
vP1y := 325

; 佩罗拉瀑布
vPFx := 250
vPFy := 660

; AutoClicker "Go" button
vACGx := 40
vACGy := 800

; Stage Completed “Check" button
vSCCx := 250
vSCCy := 630

vSCCcolor := 0xFFEC9B

; Central center
vCCx := 370
vCCy := 450

; Central right
vCRx := 400
vCRy := 450

; Bottom left
vBLx := 135
vBLy := 620

; Bottom center
vBCx := 370
vBCy := 620

; Bottom right
vBRx := 400
vBRy := 620

Wait1 := 1500
Wait2 := 15000
Wait3 := 60000

vColor1 := 0xE8C586
vColor2 := 0xE8C584
vColor3 := 0xE9C685

vTickButtonColor := 0x722A21


Gosub, subPatrol

ExitApp


subPatrol:

    WinActivate, %vWin%
    MouseMove, %vHitButtonX%, %vHitButtonY%,
    ; PixelGetColor, vColor, 40, 500, Slow RGB

    Loop {
        WinActivate, %vWin%

        MouseMove, vDashButtonX, vDashButtonY
        Click, vDashButtonX, vDashButtonY
        Sleep, 100

        MouseMove, vShieldButtonX, vShieldButtonY
        Click, vShieldButtonX, vShieldButtonY
        Sleep, 100

        MouseMove, vPotionButtonX, vPotionButtonY
        Click, vPotionButtonX, vPotionButtonY
        Sleep, 100

        PixelGetColor, vColor, vTickButtonX, vTickButtonY, Slow RGB
        If (vColor == vTickButtonColor) {
	  MouseMove, vTickButtonX, vTickButtonY
            Click, vTickButtonX, vTickButtonY

            Break
        }
    }



Return






Loop
{

    ; 檢測獎牌窗口是否彈出
    WinActivate, %vWin%
    MouseMove, 40, 500
    PixelGetColor, vColor, 40, 500, Slow RGB

    WinActivate, %vWin%
    Click, %vACGx%, %vACGy%		; Click AutoClick "GO" to stop script
    Sleep, %Wait1%

    WinActivate, %vWin%         		; Click "Cancel" button
    Click, 250, 870
    Sleep, %Wait1%

    WinActivate, %vWin%
    Click, %vGOx%, %vGOy%		; Click "GO"
    Sleep, %Wait1%

    WinActivate, %vWin%
    ; Drag screen up
    ; MouseClickDrag, Left, 250, 670, 250, 330
    SendEvent {Click 250, 670, down}{click 250, 330, up}
    Sleep, %Wait1%

    Click, %vPFx%, %vPFy%		; Click bottom pane
    Sleep, %Wait1%

    WinActivate, %vWin%

    Click, %vACGx%, %vACGy%	; Click AutoClicker "GO"
    SoundBeep
    Sleep, %Wait3%
    Sleep, 15000
    SoundBeep 

    WinActivate, %vWin%

    ; Interim click & go ==============================
    Click, %vACGx%, %vACGy%	; Click AutoClicker "GO" again to stop it
    Sleep, %Wait1%

    WinActivate, %vWin%
    Click, %vSCCx%, %vSCCy%	; Click "Cancel" button
    Sleep, %Wait1%			

    ; Continue
    WinActivate, %vWin%
    Click, %vGOx%, %vGOy%		; Click "GO"
    Sleep, %Wait1%

    WinActivate, %vWin%
    Click, %vACGx%, %vACGy%	; Click AutoClicker "GO" to start again
    SoundBeep
    SoundBeep
    Sleep, %Wait3%          ; Long wait

    WinActivate, %vWin%
    Click, %vACGx%, %vACGy%	; Click AutoClicker "GO" to stop
    Sleep, %Wait1%

    WinActivate, %vWin%
    Click, %vSCCx%, %vSCCy%	; Click Stage Completed "Check" button
    Sleep, %Wait2%			; Wait for about 10 seconds

} ; End of outmost Loop


; ===================================
; Special handler, stop with Esc key.
Esc::ExitApp
