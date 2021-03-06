; #FUNCTION# ====================================================================================================================
; Name ..........: ReturnHome
; Description ...: Returns home when in battle, will take screenshot and check for gold/elixir change unless specified not to.
; Syntax ........: ReturnHome([$TakeSS = 1[, $GoldChangeCheck = True]])
; Parameters ....: $TakeSS              - [optional] flag for saving a snapshot of the winning loot. Default is 1.
;                  $GoldChangeCheck     - [optional] an unknown value. Default is True.
; Return values .: None
; Author ........:
; Modified ......: KnowJack (Jun/Aug2015)
; Remarks .......: This file is part of MyBot, previously known as ClashGameBot. Copyright 2015
;                  MyBot is distributed under the terms of the GNU GPL
; Related .......:
; Link ..........: https://github.com/MyBotRun/MyBot/wiki
; Example .......: No
; ===============================================================================================================================
Func ReturnHome($TakeSS = 1, $GoldChangeCheck = True) ;Return main screen
   If $DebugSetLog  = 1 Then Setlog("ReturnHome function... (from matchmode=" & $iMatchMode & " - " &  $sModeText[$iMatchMode] & ")" , $COLOR_PURPLE)
	Local $counter = 0
	Local $hBitmap_Scaled
	Local $i

	If $DisableOtherEBO And $iMatchMode = $LB And $iChkDeploySettings[$LB] = 6 And $DESideEB And ($dropQueen Or $dropKing) Then
		SaveandDisableEBO()
		SetLog("Disabling Normal End Battle Options", $COLOR_GREEN)
	EndIf
	If $GoldChangeCheck = True Then


	     If not(IsReturnHomeBattlePage(True,False) ) Then ; if already in return home battle page do not wait and try to activate Hero Ability and close battle
		   SetLog("Checking if the battle has finished", $COLOR_BLUE)
		   While GoldElixirChangeEBO()
			   If _Sleep($iDelayReturnHome1) Then Return
			   WEnd
			   DEDropSmartSpell()
		   ;If Heroes were not activated: Hero Ability activation before End of Battle to restore health
		   If ($checkKPower = True Or $checkQPower = True) And $iActivateKQCondition = "Auto" Then
			   ;_CaptureRegion()
			   If _ColorCheck(_GetPixelColor($aRtnHomeCheck1[0], $aRtnHomeCheck1[1], True), Hex($aRtnHomeCheck1[2], 6), $aRtnHomeCheck1[3]) = False And _ColorCheck(_GetPixelColor($aRtnHomeCheck2[0], $aRtnHomeCheck2[1], True), Hex($aRtnHomeCheck2[2], 6), $aRtnHomeCheck2[3]) = False Then ; If not already at Return Homescreen
				   If $checkKPower = True Then
					   SetLog("Activating King's power to restore some health before EndBattle", $COLOR_BLUE)
					   If IsAttackPage() Then SelectDropTroop($King) ;If King was not activated: Boost King before EndBattle to restore some health
				   EndIf
				   If $checkQPower = True Then
					   SetLog("Activating Queen's power to restore some health before EndBattle", $COLOR_BLUE)
					   If IsAttackPage() Then SelectDropTroop($Queen) ;If Queen was not activated: Boost Queen before EndBattle to restore some health
				   EndIf
			   EndIf
			EndIf
		 Else
			If $debugsetlog=1 Then Setlog("Battle already over",$COLOR_PURPLE)
		 EndIf

	EndIf

	If $DisableOtherEBO And $iMatchMode = $LB And $iChkDeploySettings[$LB] = 6 And $DESideEB And ($dropQueen Or $dropKing) Then
		RevertEBO()
	EndIf

	$checkKPower = False
	$checkQPower = False
	$checkWPower = False

	If $iMatchMode = $TS And $icmbTroopComp <> 8 Then $FirstStart = True ;reset barracks upon return when TH sniping w/custom army

	SetLog("Returning Home", $COLOR_BLUE)
	If $RunState = False Then Return


   If not (IsReturnHomeBattlePage(True,False) ) Then

	  ; ---- CLICK SURRENDER BUTTON ----
 	   $i = 0 ; Reset Loop counter
	   While 1
		   If _CheckPixel($aSurrenderButton, $bCapturePixel) Then
			   If IsAttackPage() Then ClickP($aSurrenderButton, 1, 0, "#0099") ;Click Surrender
			   ExitLoop
		   Else
			   $i += 1
		   EndIf
		   If $i > 10 Then ExitLoop  ; if end battle or surrender button are not found in 10*200mms or 2 seconds, then give up.
		   If _Sleep($iDelayReturnHome5) Then Return
	   WEnd
	   If _Sleep($iDelayReturnHome2) Then Return ; short wait for confirm button to appear

	   ; ---- CLICK OK CLOSE BATTLE (SURRENDER)
	   $i = 0 ; Reset Loop counter
	   While 1  ; Look for Okay button on the confirm surrender window before clicking to avoid troop deployment, since button is green (same as grass) have to search for edges of the button
		   Local $offColors[3][3] = [[0x000000, 144, 0], [0xFFFFFF, 54, 17], [0xCBE870, 54, 10]] ; 2nd Black opposite button, 3rd pixel white "O" center top, 4th pixel White "0" bottom center
		   Global $ButtonPixel = _MultiPixelSearch(438, 372 + $midOffsetY, 590, 404 + $midOffsetY, 1, 1, Hex(0x000000, 6), $offColors, 20) ; first vertical black pixel of Okay
		   If $debugSetlog = 1 Then Setlog("Confirm Surrender color #1: " & _GetPixelColor(441, 374, True) & ", #2: " & _GetPixelColor(441 + 144, 374, True) & ", #3: " & _GetPixelColor(441 + 54, 374 + 17, True) & ", #4: " & _GetPixelColor(441 + 54, 374 + 10, True), $COLOR_PURPLE)
		   If IsArray($ButtonPixel) Then
			   If $debugSetlog = 1 Then
				   Setlog("ButtonPixel = " & $ButtonPixel[0] & ", " & $ButtonPixel[1], $COLOR_PURPLE) ;Debug
				   Setlog("Pixel color found #1: " & _GetPixelColor($ButtonPixel[0], $ButtonPixel[1], True) & ", #2: " & _GetPixelColor($ButtonPixel[0] + 144, $ButtonPixel[1], True) & ", #3: " & _GetPixelColor($ButtonPixel[0] + 54, $ButtonPixel[1] + 17, True) & ", #4: " & _GetPixelColor($ButtonPixel[0] + 54, $ButtonPixel[1] + 27, True), $COLOR_PURPLE)
			   EndIf
			   ControlFocus($Title, "", "") ; grab window focus
			   If IsReturnHomeBattlePage() Then PureClick($ButtonPixel[0] + 75, $ButtonPixel[1] + 25, 2, 50,"#0398") ; Click Okay Button
			   ExitLoop
		   EndIf
		   If $i > 5 Then  ; if okay button not found in 5*300-400ms search time or 1.5-2 seconds, then stop searching
			   If $DebugSetlog = 1 Then
				   Setlog("Can not find Okay to surrender button, giving up", $COLOR_PURPLE)
				   if $debugImageSave= 1 Then DebugImageSave("ReturnHomeSurrenderButtonCheck_")
			   EndIf
			   ExitLoop ;
		   EndIf
		   $i += 1
	   WEnd
    Else
		If $debugsetlog=1 Then Setlog("Battle already over.",$COLOR_PURPLE)
	EndIf



	If _Sleep($iDelayReturnHome2) Then Return ; short wait for return

	TrayTip($sMODTitle, "", BitOR($TIP_ICONASTERISK, $TIP_NOSOUND)) ; clear village search match found message

	If $GoldChangeCheck = True Then
		$counter = 0
		While _ColorCheck(_GetPixelColor($aRtnHomeCheck1[0], $aRtnHomeCheck1[1], True), Hex($aRtnHomeCheck1[2], 6), $aRtnHomeCheck1[3]) = False And _ColorCheck(_GetPixelColor($aRtnHomeCheck2[0], $aRtnHomeCheck2[1], True), Hex($aRtnHomeCheck2[2], 6), $aRtnHomeCheck2[3]) = False ; test for Return Home Button
			If _Sleep($iDelayReturnHome2) Then ExitLoop
			$counter += 1
			If $counter > 40 Then ExitLoop
		WEnd
		If _Sleep($iDelayReturnHome3) Then Return ; wait for all report details
		_CaptureRegion(0, 0, $DEFAULT_WIDTH, $DEFAULT_HEIGHT - 45)
		AttackReport()
	EndIf

	If $TakeSS = 1 And $GoldChangeCheck = True Then
		SetLog("Taking snapshot of your loot", $COLOR_GREEN)
		Local $Date = @YEAR & "-" & @MON & "-" & @MDAY
		Local $Time = @HOUR & "." & @MIN
		_CaptureRegion(0, 0, $DEFAULT_WIDTH, $DEFAULT_HEIGHT - 45)
		$hBitmap_Scaled = _GDIPlus_ImageResize($hBitmap, _GDIPlus_ImageGetWidth($hBitmap) / 2, _GDIPlus_ImageGetHeight($hBitmap) / 2) ;resize image
		; screenshot filename according with new options around filenames
		If $ScreenshotLootInfo = 1 Then
			$LootFileName = $Date & "_" & $Time & " G" & $iGoldLast & " E" & $iElixirLast & " DE" & $iDarkLast & " T" & $iTrophyLast & " S" & StringFormat("%3s", $SearchCount) & ".jpg"
		Else
			$LootFileName = $Date & "_" & $Time & ".jpg"
		EndIf
		_GDIPlus_ImageSaveToFile($hBitmap_Scaled, $dirLoots & $LootFileName)
		_GDIPlus_ImageDispose($hBitmap_Scaled)
	EndIf

	;push images if requested..
	If $GoldChangeCheck = True Then
		PushMsg("LastRaid")
	EndIf

	$i = 0 ; Reset Loop counter
	While 1
		If _CheckPixel($aEndFightSceneAvl, $bCapturePixel) Then  ; check for the gold ribbon in the end of battle data screen
			If IsReturnHomeBattlePage() Then ClickP($aReturnHomeButton, 1, 0, "#0101") ;Click Return Home Button
			ExitLoop
		Else
			$i += 1
		EndIf
		If $i > 10 Then ExitLoop  ; if end battle window is not found in 10*200mms or 2 seconds, then give up.
		If _Sleep($iDelayReturnHome5) Then Return
	WEnd
	If _Sleep($iDelayReturnHome2) Then Return ; short wait for screen to close

	$counter = 0
	While 1
		If _Sleep($iDelayReturnHome4) Then Return
		_CaptureRegion()
		If _ColorCheck(_GetPixelColor($aIsMain[0], $aIsMain[1]), Hex($aIsMain[2], 6), $aIsMain[3]) Then
			_GUICtrlEdit_SetText($txtLog, _PadStringCenter(" BOT LOG ", 71, "="))
			_GUICtrlRichEdit_SetFont($txtLog, 6, "Lucida Console")
			_GUICtrlRichEdit_AppendTextColor($txtLog, "" & @CRLF, _ColorConvert($Color_Black))
			Return
		EndIf

		$counter += 1

		If $counter >= 50 Or isProblemAffect(True) Then
			SetLog("Cannot return home.", $COLOR_RED)
			checkMainScreen()
			Return
		EndIf
	WEnd
EndFunc   ;==>ReturnHome


