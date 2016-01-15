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
    ;;; Multy Farming
    ;;;;;;;;;;;;;;;;;
	Local $x = 30, $y = 150
	  $grpMultyFarming = GUICtrlCreateGroup("Multy Farming Mode", $x - 20, $y - 20, 220, 85)
	  $chkSwitchDonate = GUICtrlCreateCheckbox("Switch Account And Donate", $x, $y, -1, -1)
			$txtTip = "Will Switch  account and  Donate  Then Switchh back"
			GUICtrlSetTip(-1, $txtTip)
			GUICtrlSetOnEvent(-1, "SwitchADonate")
   $y +=20
	  $chkMultyFarming = GUICtrlCreateCheckbox("Multy Farming Mode", $x, $y, -1 , -1)
			$txtTip = "Will Switch  account and  attack  Then Switch back"
			GUICtrlSetTip(-1, $txtTip)
			GUICtrlSetOnEvent(-1, "MultyFarming")

GUICtrlCreateGroup("", -99, -99, 1, 1)

GUICtrlCreateTabItem("")
