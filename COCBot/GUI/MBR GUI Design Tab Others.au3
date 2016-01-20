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

    Local $x = 210, $y = 150
    $grpStatsMisc = GUICtrlCreateGroup("Smart Zap Drill", $x - 20, $y - 20, 175, 65)
		 GUICtrlCreateIcon($pIconLib, $eIcnLightSpell, $x - 10, $y + 5, 24, 24)
		 $chkSmartLightSpell = GUICtrlCreateCheckbox("Use Ligthning", $x + 20, $y - 5, -1, -1)
			$txtTip = "Check this to drop lightning spells on DE drills"
			GUICtrlSetTip(-1, $txtTip)
			GUICtrlSetOnEvent(-1, "SmartLightSpell")
		 $chkTrainLightSpell = GUICtrlCreateCheckbox("Auto train lighting spell", $x + 20, $y + 20, -1, -1)
			$txtTip = "Check this to always create spell lightning please set 0 lightnig spell on troops tab"
			GUICtrlSetTip(-1, $txtTip)
		 $txtMinDark = GUICtrlCreateInput("1000", $x + 110, $y - 5, 35, 21, BitOR($GUI_SS_DEFAULT_INPUT, $ES_CENTER, $ES_NUMBER))
			$txtTip = "Input The Min Dark Elixer You Want To Drill Zap"
			GUICtrlSetTip(-1, $txtTip)
			GUICtrlSetLimit(-1, 4)
			GUICtrlSetOnEvent(-1, "txtMinDark")
			GUICtrlSetState(-1, $GUI_DISABLE)
	Local $x = 365, $y = 150
	   $grpStatuszap = GUICtrlCreateGroup("Status", $x, $y - 20, 100, 65)
		$picSmartZap = GUICtrlCreateIcon($pIconLib, $eIcnDark, $x + 75, $y - 8, 21, 21)
		$lblSmartZap = GUICtrlCreateLabel("0", $x -10, $y - 5, 80, 30, $SS_RIGHT)
		GUICtrlSetFont(-1, 12, $FW_BOLD, Default, "arial", $CLEARTYPE_QUALITY)
		GUICtrlSetColor(-1, 0x279B61)
		$txtTip = "The amount of Dark Elixir you zapped."
	    GUICtrlSetTip(-1, $txtTip)
		GUICtrlCreateIcon($pIconLib, $eIcnLightSpell, $x + 75, $y + 17, 21, 21)
		$lblLightningUsed = GUICtrlCreateLabel("0", $x -10, $y + 20, 80, 30, $SS_RIGHT)
		GUICtrlSetFont(-1, 12, $FW_BOLD, Default, "arial", $CLEARTYPE_QUALITY)
		GUICtrlSetColor(-1,0x279B61)
		$txtTip = "The amount of Lightning Spells Used in zapping."
	    GUICtrlSetTip(-1, $txtTip)


GUICtrlCreateTabItem("")
