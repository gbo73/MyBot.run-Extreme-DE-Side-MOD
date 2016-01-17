; #FUNCTION# ====================================================================================================================
; Name ..........: MBR GUI Design Others
; Description ...: This file Includes GUI Design
; Syntax ........:
; Parameters ....: None
; Return values .: None
; Author ........:
; Modified ......: Lakereng (2016) And Extreme DE Side MOD
; Remarks .......: This file is part of MyBot, previously known as ClashGameBot. Copyright 2015
;                  MyBot is distributed under the terms of the GNU GPL
; Related .......:
; Link ..........: https://github.com/MyBotRun/MyBot/wiki
; Example .......: No
; ===============================================================================================================================

$tabOthers = GUICtrlCreateTabItem("Others")
	;;;;;;;;;;;;;;;;;
    ;;; Mult-Farming
    ;;;;;;;;;;;;;;;;;
	Local $x = 30, $y = 150
	$grpMultyFarming = GUICtrlCreateGroup("Multi-Farming Mode", $x - 20, $y - 20, 180, 65)
		$chkSwitchDonate = GUICtrlCreateCheckbox("Switch Account and Donate", $x - 5, $y - 5, -1, -1)
			$txtTip = "Will switch account and Donate, then switch back"
			GUICtrlSetTip(-1, $txtTip)
			GUICtrlSetOnEvent(-1, "SwitchAndDonate")
	$y += 20
		$chkMultyFarming = GUICtrlCreateCheckbox("Multi-Farming Mode", $x - 5, $y, -1 , -1)
			$txtTip = "Will switch account and attack, then switch back"
			GUICtrlSetTip(-1, $txtTip)
			GUICtrlSetOnEvent(-1, "MultiFarming")
	GUICtrlCreateGroup("", -99, -99, 1, 1)

    Local $x = 10, $y = 440
	$grpHideAndroid = GUICtrlCreateGroup("Hide Android Options", $x, $y, 450, 65)
		$chkHideTaskBar = GUICtrlCreateCheckbox("Hide Taskbar Icon", $x + 15, $y + 15, -1, -1)
			$txtTip = "This will hide the android client from the taskbar when you press the Hide button"
			GUICtrlSetTip(-1, $txtTip)
			GUICtrlSetOnEvent(-1, "HideTaskbar")
	$y += 40
		$lblHideTaskBar = GUICtrlCreateLabel("Warning: May cause erratic behaviour, uncheck if you have problems.", $x + 15, $y, 420, 30, $SS_LEFT)
	GUICtrlCreateGroup("", -99, -99, 1, 1)


GUICtrlCreateTabItem("")
