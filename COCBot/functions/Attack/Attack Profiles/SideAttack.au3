Func LaunchSideAttack($listInfoDeploy, $CC, $King, $Queen, $Warden)
	Local $listListInfoDeployTroopPixel[0]
	Local $barPosition = -1, $earthquakeDropped = 0, $spellCount = 0, $unitCount = 0
	Local $RandomEdge = $Edges[$BuildingEdge], $RandomXY = 2
	Local $kind

	If $debugSetlog = 1 Then SetLog("LaunchSideAttackTroop with CC " & $CC & ", K " & $King & ", Q " & $Queen & ", W " & $Warden , $COLOR_PURPLE)

	; $debugSetlog = 1
	Local $aDeployButtonPositions = getUnitLocationArray()
	; $debugSetlog = 0

	For $i = 0 To UBound($listInfoDeploy) - 1
		$kind = $listInfoDeploy[$i][0]
		$barPosition = $aDeployButtonPositions[$kind]

		If $kind <> $DeDeployEmptyString And $barPosition <> -1 Then
			Switch $kind
				Case $eKing
					If $LBBKEQFilter = 0 OR $earthquakeDropped = 1  Then
						dropHeroes($RandomEdge[$RandomXY][0], $RandomEdge[$RandomXY][1], $King, -1, -1)
					Else
						SetLog("Saving king for earthquakes")
					EndIf
				Case $eQueen
					dropHeroes($RandomEdge[$RandomXY][0], $RandomEdge[$RandomXY][1], -1, $Queen, -1)
				Case $eWarden
					dropHeroes($RandomEdge[$RandomXY][0], $RandomEdge[$RandomXY][1], -1, -1, $Warden)
				Case $eCastle
					dropCC($RandomEdge[$RandomXY][0], $RandomEdge[$RandomXY][1], $CC)
				Case $eRSpell, $eHSpell, $eJSpell, $eHaSpell, $eFSpell, $ePSpell
					$spellCount = spellCount($kind)

					If $spellCount > 0 Then
						SetLog("Dropping spell " & getTranslatedTroopName($kind) & " at " & $listInfoDeploy[$i][4] & "% distance")
						If $BuildingLoc = 1 Then
							;drop spell towards the DE storage
							dropSpell(ceiling((((100-$listInfoDeploy[$i][4])*$RandomEdge[$RandomXY][0])+($listInfoDeploy[$i][4]*$BuildingLocx))/100), _
									  ceiling((((100-$listInfoDeploy[$i][4])*$RandomEdge[$RandomXY][1])+($listInfoDeploy[$i][4]*$BuildingLocy))/100), _
									  $kind)
						Else
							;drop spell towards the center
							dropSpell(ceiling((((100-$listInfoDeploy[$i][4])*$RandomEdge[$RandomXY][0])+($listInfoDeploy[$i][4]*430))/100), _
									  ceiling((((100-$listInfoDeploy[$i][4])*$RandomEdge[$RandomXY][1])+($listInfoDeploy[$i][4]*313))/100), _
									  $kind)
						EndIf
					EndIf
				Case $eESpell
					; $debugSetlog = 1
					$spellCount = spellCount($kind)

					If $spellCount >= 4 Then ;4 quakes or go home
						SetLog("Dropping " & getTranslatedTroopName($kind) & " at " & $listInfoDeploy[$i][4] & "% distance")

						If $BuildingLoc = 1 Then
							;drop spell towards the DE storage
							dropEarth(ceiling((((100-$listInfoDeploy[$i][4])*$RandomEdge[$RandomXY][0])+($listInfoDeploy[$i][4]*$BuildingLocx))/100), _
									  ceiling((((100-$listInfoDeploy[$i][4])*$RandomEdge[$RandomXY][1])+($listInfoDeploy[$i][4]*$BuildingLocy))/100), _
									  $kind)
						Else
							;drop spell towards the center
							dropEarth(ceiling((((100-$listInfoDeploy[$i][4])*$RandomEdge[$RandomXY][0])+($listInfoDeploy[$i][4]*430))/100), _
									  ceiling((((100-$listInfoDeploy[$i][4])*$RandomEdge[$RandomXY][1])+($listInfoDeploy[$i][4]*313))/100), _
									  $kind)
						EndIf

						$earthquakeDropped = 1
					Else
						If $spellCount > 0 and $spellCount < 4 Then SetLog("Only " & $spellCount & " " & getTranslatedTroopName($kind) & " available.  Waiting for 4.")
					EndIf
					; $debugSetlog = 0
				Case Else
					$unitCount = unitCount($kind)

					If $unitCount > 0 Then
						If LaunchTroops($kind, $listInfoDeploy[$i][1], $listInfoDeploy[$i][2], $listInfoDeploy[$i][3], $listInfoDeploy[$i][4]) Then
							If _Sleep(SetSleep(1)) Then Return
						EndIf
					EndIf
			EndSwitch
		EndIf
	Next

	Return True
EndFunc   ;==>LaunchSideAttackTroop
