; #FUNCTION# ====================================================================================================================
; Name ..........: MBR GUI Design
; Description ...: This file Includes GUI Design
; Syntax ........:
; Parameters ....: None
; Return values .: None
; Author ........: GKevinOD (2014)
; Modified ......: lakereng,DkEd, Hervidero (2015)
; Remarks .......: This file is part of MyBot, previously known as ClashGameBot. Copyright 2015
;                  MyBot is distributed under the terms of the GNU GPL
; Related .......:
; Link ..........: https://github.com/MyBotRun/MyBot/wiki
; Example .......: No
; ===============================================================================================================================

;~ -------------------------------------------------------------
;~ Search Tab
;~ -------------------------------------------------------------

$tabSearch = GUICtrlCreateTabItem("Search")
	Local $x = 30, $y = 150
		$grpSearchMode = GUICtrlCreateGroup("Search Mode", $x - 20, $y - 20, 160, 55)
			$cmbSearchMode = GUICtrlCreateCombo("", $x - 10 , $y, 140, -1, BitOR($CBS_DROPDOWNLIST, $CBS_AUTOHSCROLL))
				$txtTip = "Only Deadbases: full collectors. Most loot outside of village." & @CRLF & _
						  "Only LiveBases: full storages. Most loot inside of village." & @CRLF & "Dual Mode: Search for both, whatever comes first is attacked."
				GUICtrlSetData(-1, "Only DeadBases|Only LiveBases|Both Dead & LiveBases", "Only DeadBases")
				GUICtrlSetTip(-1, $txtTip)
				GUICtrlSetOnEvent(-1, "cmbSearchMode")
		GUICtrlCreateGroup("", -99, -99, 1, 1)

	Local $x = 380, $y = 150
		$grpHeroFilterSwitch = GUICtrlCreateGroup("Advanced Search", $x - 20, $y - 20, 100, 55)
			$btnHeroSwitch = GUICtrlCreateButton("Normal Filters", $x - 15, $y - 5, 90, 35)
				IF $btnColor then GUICtrlSetBkColor(-1, 0x5CAD85)
				GUICtrlSetOnEvent($btnHeroSwitch, "hidenormal")
				GUICtrlSetState($btnHeroSwitch, $GUI_HIDE)
			$btnNormalSwitch = GUICtrlCreateButton("Advanced Filters", $x - 15, $y - 5, 90, 35)
				IF $btnColor then GUICtrlSetBkColor(-1, 0xDB4D4D)
				GUICtrlSetOnEvent($btnNormalSwitch, "hidehero")
		GUICtrlCreateGroup("", -99, -99, 1, 1)

	#include "Search\grpDeadBase.au3"
	#include "Search\grpLiveBase.au3"
	#include "Search\grpHeroLiveBase.au3"

	Local $x = 30, $y = 445
		$grpSearchReduction = GUICtrlCreateGroup(GetTranslated(2,47, "Search Reduction"), $x - 20, $y - 20, 450, 80)
			$chkAlertSearch = GUICtrlCreateCheckbox(GetTranslated(2,9, "Alert me when a Base is found."), $x, $y - 8, -1, -1, $BS_MULTILINE)
				GUICtrlSetTip(-1, GetTranslated(2,10, "Check this if you want an Audio alarm & a Balloon Tip when a Base to attack is found."))
				GUICtrlSetState(-1, $GUI_CHECKED)
			$chkRestartSearchLimit = GUICtrlCreateCheckbox( GetTranslated(2, 11, "Restart every") & ":", $x + 240, $y - 8, -1, -1)
				$txtTip = GetTranslated(2, 12, "Return To Base after x searches and restart to search enemy villages.")
				GUICtrlSetTip(-1, $txtTip)
				GUICtrlSetOnEvent(-1, "chkRestartSearchLimit")
			$txtRestartSearchlimit = GUICtrlCreateInput("15", $x + 326, $y - 7, 25, 18, BitOR($GUI_SS_DEFAULT_INPUT, $ES_CENTER, $ES_NUMBER))
				GUICtrlSetTip(-1, $txtTip)
				GUICtrlSetLimit(-1, 3)
				GUICtrlSetState(-1, $GUI_DISABLE)
			$lblRestartSearchLimit = GUICtrlCreateLabel( GetTranslated(2, 13,"searches."), $x + 357, $y - 2, -1, -1)
		$y += 24
			$chkSearchReduction = GUICtrlCreateCheckbox(GetTranslated(2,48, "Lower Aim, Every") & ":", $x , $y, -1, -1)
				$txtTip = GetTranslated(2,49, "Check this if you want the search values to automatically be lowered after a certain amount of searches.")
				GUICtrlSetTip(-1, $txtTip)
				GUICtrlSetState(-1, $GUI_CHECKED)
				GUICtrlSetOnEvent(-1, "chkSearchReduction")
			$txtSearchReduceCount = GUICtrlCreateInput("20", $x + 105, $y + 2, 35, 18, BitOR($GUI_SS_DEFAULT_INPUT, $ES_CENTER, $ES_NUMBER))
				$txtTip = GetTranslated(2,50, "Enter the No. of searches to wait before each reduction occures.")
				GUICtrlSetTip(-1, $txtTip)
				GUICtrlSetLimit(-1, 3)
			$lblSearchReduceCount = GUICtrlCreateLabel(GetTranslated(2,51, "search(es)."), $x + 145, $y + 3, -1, -1)
		$x += 210
		$y -= 9
			$lblSearchReduceGold = GUICtrlCreateLabel("-", $x, $y + 3, -1, 17)
				$txtTip = GetTranslated(2,52, "Lower value for Gold by this amount on each step.")
				GUICtrlSetTip(-1, $txtTip)
			$txtSearchReduceGold = GUICtrlCreateInput("2000", $x + 5, $y, 40, 18, BitOR($GUI_SS_DEFAULT_INPUT, $ES_CENTER, $ES_NUMBER))
				GUICtrlSetTip(-1, $txtTip)
				GUICtrlSetLimit(-1, 5)
			$picSearchReduceGold = GUICtrlCreateIcon($pIconLib, $eIcnGold, $x + 46, $y, 16, 16)
				GUICtrlSetTip(-1, $txtTip)
		$y += 21
			$lblSearchReduceElixir = GUICtrlCreateLabel("-", $x, $y + 3, -1, 17)
				$txtTip = GetTranslated(2,53, "Lower value for Elixir by this amount on each step.")
				GUICtrlSetTip(-1, $txtTip)
			$txtSearchReduceElixir = GUICtrlCreateInput("2000", $x + 5, $y, 40, 18, BitOR($GUI_SS_DEFAULT_INPUT, $ES_CENTER, $ES_NUMBER))
				GUICtrlSetTip(-1, $txtTip)
				GUICtrlSetLimit(-1, 5)
			$picSearchReduceElixir = GUICtrlCreateIcon($pIconLib, $eIcnElixir, $x + 46, $y, 16, 16)
				GUICtrlSetTip(-1, $txtTip)
		$x += 70
		$y -= 10
			$lblSearchReduceGoldPlusElixir = GUICtrlCreateLabel("-", $x, $y + 3, -1, 17)
				$txtTip = GetTranslated(2,54, "Lower total sum for G+E by this amount on each step.")
				GUICtrlSetTip(-1, $txtTip)
			$txtSearchReduceGoldPlusElixir = GUICtrlCreateInput("4000", $x + 5, $y, 40, 18, BitOR($GUI_SS_DEFAULT_INPUT, $ES_CENTER, $ES_NUMBER))
				GUICtrlSetTip(-1, $txtTip)
				GUICtrlSetLimit(-1, 5)
			$picSearchReduceGPEGold = GUICtrlCreateIcon($pIconLib, $eIcnGold, $x + 46, $y + 1, 16, 16)
				GUICtrlSetTip(-1, $txtTip)
			$lblSearchReduceGPE = GUICtrlCreateLabel("+", $x + 62, $y + 1, -1, -1)
				GUICtrlSetTip(-1, $txtTip)
			$picSearchReduceGPEElixir = GUICtrlCreateIcon($pIconLib, $eIcnElixir, $x + 68, $y + 1, 16, 16)
				GUICtrlSetTip(-1, $txtTip)
		$x += 90
		$y -= 11
			$lblSearchReduceDark = GUICtrlCreateLabel("-", $x, $y + 3, -1, 17)
				$txtTip = GetTranslated(2,55, "Lower value for Dark Elixir by this amount on each step.")
				GUICtrlSetTip(-1, $txtTip)
			$txtSearchReduceDark = GUICtrlCreateInput("100", $x + 5, $y, 35, 18, BitOR($GUI_SS_DEFAULT_INPUT, $ES_CENTER, $ES_NUMBER))
				GUICtrlSetTip(-1, $txtTip)
				GUICtrlSetLimit(-1, 3)
			$picSearchReduceDark = GUICtrlCreateIcon($pIconLib, $eIcnDark, $x + 41, $y, 16, 16)
				GUICtrlSetTip(-1, $txtTip)
			$y += 21
			$lblSearchReduceTrophy = GUICtrlCreateLabel("-", $x, $y + 3, -1, 17)
				$txtTip = GetTranslated(2,56, "Lower value for Trophies by this amount on each step.")
				GUICtrlSetTip(-1, $txtTip)
			$txtSearchReduceTrophy = GUICtrlCreateInput("2", $x + 5, $y, 35, 18, BitOR($GUI_SS_DEFAULT_INPUT, $ES_CENTER, $ES_NUMBER))
				GUICtrlSetTip(-1, $txtTip)
				GUICtrlSetLimit(-1, 1)
			$picSearchReduceTrophy = GUICtrlCreateIcon($pIconLib, $eIcnTrophy, $x + 41, $y, 16, 16)
				GUICtrlSetTip(-1, $txtTip)
		GUICtrlCreateGroup("", -99, -99, 1, 1)
GUICtrlCreateTabItem("")

