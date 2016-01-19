; #FUNCTION# ====================================================================================================================
; Name ..........: MBR GUI Design
; Description ...: This file Includes GUI Design
; Syntax ........:
; Parameters ....: None
; Return values .: None
; Author ........: GKevinOD (2014)
; Modified ......: LunaEclipse (Jan-2016), lakereng, DkEd, Hervidero (2015)
; Remarks .......: This file is part of MyBot, previously known as ClashGameBot. Copyright 2015
;                  MyBot is distributed under the terms of the GNU GPL
; Related .......:
; Link ..........: https://github.com/MyBotRun/MyBot/wiki
; Example .......: No
; ===============================================================================================================================

;~ -------------------------------------------------------------
;~ Search Tab
;~ -------------------------------------------------------------

Local $x = 30, $y = 150
	$grpSkipCentreDE = GUICtrlCreateGroup("Skip Centre DE", $x - 20, $y - 20, 170, 55)
		GUICtrlSetState (-1, $GUI_HIDE)
		$cmbSkipCentreDE = GUICtrlCreateCombo("", $x - 15 , $y, 160, -1, BitOR($CBS_DROPDOWNLIST, $CBS_AUTOHSCROLL))
			$txtTip = "Always attack centre DE storage no filter" & @CRLF & _
					"Always skip base when DE is in the centre." & @CRLF & "Only skip centre DE base if either BK or AQ filter enabled and they are healing."
			GUICtrlSetData(-1, "Always Attack Centre DE|Always Skip Centre DE|Skip When BK/AQ Sleeping", "Always Attack Centre DE")
			GUICtrlSetTip(-1, $txtTip)
			GUICtrlSetState (-1, $GUI_HIDE)
	GUICtrlCreateGroup("", -99, -99, 1, 1)

Local $x = 205, $y = 150
	$grpSkipUndetectedDE = GUICtrlCreateGroup("Skip Undetected DE", $x - 20, $y - 20, 170, 55)
		GUICtrlSetState (-1, $GUI_HIDE)
		$cmbSkipUndetectedDE = GUICtrlCreateCombo("", $x - 15 , $y, 160, -1, BitOR($CBS_DROPDOWNLIST, $CBS_AUTOHSCROLL))
			$txtTip = "Always attack undetected DE storage no filter" & @CRLF & _
					  "Always skip base when DE is not found." & @CRLF & "Only skip undetected DE base if either BK or AQ filter enabled and they are healing."
			GUICtrlSetData(-1, "Always Attack Undetected DE|Always Skip Undetected DE|Skip When BK/AQ Sleeping", "Always Attack Centre DE")
			GUICtrlSetTip(-1, $txtTip)
			GUICtrlSetState (-1, $GUI_HIDE)
	GUICtrlCreateGroup("", -99, -99, 1, 1)

Local $x = 30, $y = 210
	$grpLiveBaseConditionsKing = GUICtrlCreateGroup("King Filter", $x - 20, $y - 20, 225, 130)
		GUICtrlSetState (-1, $GUI_HIDE)
		GUICtrlCreateIcon($pIconLib, $eIcnKing, $x +30, $y +40, 24, 24)
		GUICtrlSetState (-1, $GUI_HIDE)
		$chkLBBKFilter = GUICtrlCreateCheckbox("Enable For BK", $x + 70, $y + 45, -1, -1)
			$txtTip = "Enable this so that when King is healing bot will use new search conditions for Live Bases"
			GUICtrlSetTip(-1, $txtTip)
			GUICtrlSetState(-1, $GUI_HIDE)
			GUICtrlSetOnEvent(-1, "chkLBBKFilter")
		$chkLBBKEQFilter = GUICtrlCreateCheckbox("Coordinate with EQ", $x + 70, $y + 70, -1, -1)
			$txtTip = "Enable this so that when King and EQ will be used together"
			GUICtrlSetTip(-1, $txtTip)
			GUICtrlSetState(-1, $GUI_HIDE)
	GUICtrlCreateGroup("", -99, -99, 1, 1)

	$grpLiveBaseConditionsQueen = GUICtrlCreateGroup("Queen Filter", $x - 20, $y + 110, 225, 125)
		GUICtrlSetState (-1, $GUI_HIDE)
		GUICtrlCreateIcon($pIconLib, $eIcnQueen, $x +30, $y +160, 24, 24)
		GUICtrlSetState (-1, $GUI_HIDE)
		$chkLBAQFilter = GUICtrlCreateCheckbox("Enable For AQ", $x + 70, $y + 165, -1, -1)
			$txtTip = "Enable this so that when Queen is healing bot will use new search conditions for Live Bases"
			GUICtrlSetTip(-1, $txtTip)
			GUICtrlSetState(-1, $GUI_HIDE)
	GUICtrlCreateGroup("", -99, -99, 1, 1)

Local $x = 260, $y = 210
	$grpLiveBaseConditionsHero = GUICtrlCreateGroup("LiveBase No Hero Filter Conditions", $x - 20, $y - 20, 220, 255)
$y += 21
		$cmbABMeetGEHero = GUICtrlCreateCombo("", $x , $y + 10, 65, -1, BitOR($CBS_DROPDOWNLIST, $CBS_AUTOHSCROLL))
			$txtTip = "Search for a base that meets the values set for Min. Gold, Elixir."
			GUICtrlSetData(-1, "G And E|G Or E|G + E", "G + E")
			GUICtrlSetTip(-1, $txtTip)
			GUICtrlSetOnEvent(-1, "cmbABGoldElixirHero")
			GUICtrlSetState (-1, $GUI_HIDE)
		$txtABMinGoldHero = GUICtrlCreateInput("80000", $x + 80, $y, 50, 18, BitOR($GUI_SS_DEFAULT_INPUT, $ES_CENTER, $ES_NUMBER))
			$txtTip = "Set the Min. amount of Gold to search for on a village to attack."
			GUICtrlSetTip(-1, $txtTip)
			GUICtrlSetLimit(-1, 6)
			GUICtrlSetState (-1, $GUI_HIDE)
		$picABMinGoldHero = GUICtrlCreateIcon($pIconLib, $eIcnGold, $x + 131, $y, 16, 16)
			GUICtrlSetTip(-1, $txtTip)
			GUICtrlSetState (-1, $GUI_HIDE)
$y += 21
		$txtABMinElixirHero = GUICtrlCreateInput("80000", $x + 80, $y, 50, 18, BitOR($GUI_SS_DEFAULT_INPUT, $ES_CENTER, $ES_NUMBER))
			$txtTip = "Set the Min. amount of Elixir to search for on a village to attack."
			GUICtrlSetTip(-1, $txtTip)
			GUICtrlSetLimit(-1, 6)
			GUICtrlSetState (-1, $GUI_HIDE)
		$picABMinElixirHero = GUICtrlCreateIcon($pIconLib, $eIcnElixir, $x + 131, $y, 16, 16)
			GUICtrlSetTip(-1, $txtTip)
			GUICtrlSetState (-1, $GUI_HIDE)
$y -= 11
		$txtABMinGoldPlusElixirHero = GUICtrlCreateInput("160000", $x + 80, $y, 50, 20, BitOR($GUI_SS_DEFAULT_INPUT, $ES_CENTER, $ES_NUMBER))
			$txtTip = "Set the Min. amount of Gold + Elixir to search for on a village to attack."
			GUICtrlSetTip(-1, $txtTip)
			GUICtrlSetLimit(-1, 6)
			GUICtrlSetState (-1, $GUI_HIDE)
		$picABMinGPEGoldHero = GUICtrlCreateIcon($pIconLib, $eIcnGold, $x + 131, $y + 1, 16, 16)
			GUICtrlSetTip(-1, $txtTip)
			GUICtrlSetState (-1, $GUI_HIDE)
		$lblABMinGPEHero = GUICtrlCreateLabel("+", $x + 147, $y + 1, -1, -1)
			GUICtrlSetTip(-1, $txtTip)
			GUICtrlSetState (-1, $GUI_HIDE)
		$picABMinGPEElixirHero = GUICtrlCreateIcon($pIconLib, $eIcnElixir, $x + 153, $y + 1, 16, 16)
			GUICtrlSetTip(-1, $txtTip)
			GUICtrlSetState (-1, $GUI_HIDE)
$y += 31
		$chkABMeetDEHero = GUICtrlCreateCheckbox("Dark Elixir", $x , $y, -1, -1)
			$txtTip = "Search for a base that meets the value set for Min. Dark Elixir."
			GUICtrlSetOnEvent(-1, "chkABMeetDEHero")
			GUICtrlSetTip(-1, $txtTip)
			GUICtrlSetState (-1, $GUI_HIDE)
		$txtABMinDarkElixirHero = GUICtrlCreateInput("0", $x + 80, $y, 50, 18, BitOR($GUI_SS_DEFAULT_INPUT, $ES_CENTER, $ES_NUMBER))
			$txtTip = "Set the Min. amount of Dark Elixir to search for on a village to attack."
			GUICtrlSetTip(-1, $txtTip)
			GUICtrlSetLimit(-1, 5)
			GUICtrlSetState (-1, $GUI_HIDE)
			_GUICtrlEdit_SetReadOnly(-1, True)
		$picABMinDarkElixirHero = GUICtrlCreateIcon($pIconLib, $eIcnDark, $x + 131, $y, 16, 16)
			GUICtrlSetTip(-1, $txtTip)
			GUICtrlSetState (-1, $GUI_HIDE)
$y += 21
		$chkABMeetTrophyHero = GUICtrlCreateCheckbox("Trophies", $x, $y, -1, -1)
			$txtTip = "Search for a base that meets the value set for Min. Trophies."
			GUICtrlSetOnEvent(-1, "chkABMeetTrophyHero")
			GUICtrlSetTip(-1, $txtTip)
			GUICtrlSetState (-1, $GUI_HIDE)
		$txtABMinTrophyHero = GUICtrlCreateInput("0", $x + 80, $y, 50, 18, BitOR($GUI_SS_DEFAULT_INPUT, $ES_CENTER, $ES_NUMBER))
			$txtTip = "Set the Min. amount of Trophies to search for on a village to attack."
			GUICtrlSetTip(-1, $txtTip)
			GUICtrlSetState (-1, $GUI_HIDE)
			_GUICtrlEdit_SetReadOnly(-1, True)
			GUICtrlSetLimit(-1, 2)
		$picABMinTrophiesHero = GUICtrlCreateIcon($pIconLib, $eIcnTrophy, $x + 131, $y, 16, 16)
			GUICtrlSetTip(-1, $txtTip)
			GUICtrlSetState (-1, $GUI_HIDE)
$y += 21
		$chkABMeetTHHero = GUICtrlCreateCheckbox("Townhall", $x, $y, -1, -1)
			$txtTip = "Search for a base that meets the value set for Max. Townhall Level."
			GUICtrlSetOnEvent(-1, "chkABMeetTHHero")
			GUICtrlSetTip(-1, $txtTip)
			GUICtrlSetState (-1, $GUI_HIDE)
		$cmbABTHHero = GUICtrlCreateCombo("", $x + 80, $y - 1, 50, -1, BitOR($CBS_DROPDOWNLIST, $CBS_AUTOHSCROLL))
			$txtTip = "Set the Max. level of the Townhall to search for on a village to attack."
			GUICtrlSetTip(-1, $txtTip)
			GUICtrlSetState(-1, $GUI_DISABLE)
			GUICtrlSetState (-1, $GUI_HIDE)
			GUICtrlSetData(-1, "4-6|7|8|9|10", "4-6")
		$picABMaxTH1Hero = GUICtrlCreateIcon($pIconLib, $eIcnTH1, $x + 131, $y - 3, 24, 24)
			GUICtrlSetTip(-1, $txtTip)
			GUICtrlSetState (-1, $GUI_HIDE)
		$lblABMaxTHHero = GUICtrlCreateLabel("-", $x + 156, $y + 1, -1, -1)
			GUICtrlSetTip(-1, $txtTip)
			GUICtrlSetState (-1, $GUI_HIDE)
		$picABMaxTH10Hero = GUICtrlCreateIcon($pIconLib, $eIcnTH10, $x + 160, $y - 3, 24, 24)
			GUICtrlSetTip(-1, $txtTip)
			GUICtrlSetState (-1, $GUI_HIDE)
$y += 21
		$chkABMeetTHOHero = GUICtrlCreateCheckbox(GetTranslated(2,38, "Townhall Outside"), $x, $y, -1, -1)
			$txtTip = "Search for a base that has an exposed Townhall. (Outside of Walls)"
			GUICtrlSetTip(-1, $txtTip)
			GUICtrlSetState (-1, $GUI_HIDE)
$y += 21
		$chkABWeakBaseHero = GUICtrlCreateCheckbox("WeakBase", $x, $y, -1, -1)
			$txtTip = "Search for a base that has low defences."
			GUICtrlSetTip(-1, $txtTip)
			GUICtrlSetState (-1, $GUI_HIDE)
			GUICtrlSetOnEvent(-1, "chkABWeakBaseHero")
		$cmbABWeakMortarHero = GUICtrlCreateCombo("", $x + 80, $y, 50, -1, BitOR($CBS_DROPDOWNLIST, $CBS_AUTOHSCROLL))
			$txtTip = "Set the Max. level of the Mortar to search for on a village to attack."
			GUICtrlSetTip(-1, $txtTip)
			GUICtrlSetData(-1, "-|Lvl 1|Lvl 2|Lvl 3|Lvl 4|Lvl 5|Lvl 6|Lvl 7|Lvl 8", "Lvl 5")
			GUICtrlSetState(-1, $GUI_DISABLE)
			GUICtrlSetState (-1, $GUI_HIDE)
		$picABWeakMortarHero = GUICtrlCreateIcon($pIconLib, $eIcnMortar, $x + 131, $y - 3, 24, 24)
			GUICtrlSetTip(-1, $txtTip)
			GUICtrlSetState (-1, $GUI_HIDE)
$y += 23
		$cmbABWeakWizTowerHero = GUICtrlCreateCombo("", $x + 80, $y, 50, -1, BitOR($CBS_DROPDOWNLIST, $CBS_AUTOHSCROLL))
			$txtTip = "Set the Max. level of the Wizard Tower to search for on a village to attack."
			GUICtrlSetTip(-1, $txtTip)
			GUICtrlSetData(-1, "-|Lvl 1|Lvl 2|Lvl 3|Lvl 4|Lvl 5|Lvl 6|Lvl 7|Lvl 8", "Lvl 4")
			GUICtrlSetState(-1, $GUI_DISABLE)
			GUICtrlSetState (-1, $GUI_HIDE)
		$picABWeakWizTowerHero = GUICtrlCreateIcon($pIconLib, $eIcnWizTower, $x + 131, $y - 2, 24, 24)
			GUICtrlSetTip(-1, $txtTip)
			GUICtrlSetState (-1, $GUI_HIDE)
$y += 30
		$chkABMeetOneHero = GUICtrlCreateCheckbox("Meet One Then Attack", $x, $y, -1, -1)
			$txtTip = "Just meet only ONE of the above conditions, then Attack."
			GUICtrlSetTip(-1, $txtTip)
			GUICtrlSetState (-1, $GUI_HIDE)

			For $i = $grpLiveBaseConditionsKing To $chkABMeetOne
				GUICtrlSetState($i, $GUI_HIDE)
			Next
	GUICtrlCreateGroup("", -99, -99, 1, 1)
