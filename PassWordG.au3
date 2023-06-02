#NoTrayIcon
#Region ;**** Directives created by AutoIt3Wrapper_GUI ****
#AutoIt3Wrapper_Compile_Both=y
#EndRegion ;**** Directives created by AutoIt3Wrapper_GUI ****
#include <GUIConstantsEx.au3>
#include <Date.au3>

Local Const $AlphaU = "ABCDEFGHIJKLMNOPQRSTUVWXYZ", $AlphaL = "abcdefghijklmnopqrstuvwxyz"
Local Const $ADigits = "0123456789", $Special = "!#$%&'()*+,-./:;<=>?@[\]^_`{|}~"
Local Const $cNumber = "-1|0|1|2|3|4|5|6|7|8|9|10|11|12|13|14|15|16|17|18|19|20|21|22|23|24|25|26|27|28|29|30|31|32|33|34|35|36|37|38|39|40"

Local $password = "", $tpasswords = "", $toClip = True, $tVar

; M:20 U:1 L:1 D:1 S:-1 "['()*,./:;=@[\]^`{|}~]4"

Local $MaxChar = 8, $tAlphaU = 1, $tAlphaL = 1, $tADigits = 1, $tSpecial = -1, $spattern = "'()*,./;=[\]^`{|}~"
Local $Cmdlines = $CmdLineRaw, $iCmd, $tCmds, $tFileSave = ""


If $CmdLine[0] = 0 Then
	Local $m0 = GUICreate("Generate PassWord by Huei", 480, 320)
	GUICtrlCreateLabel("Min Number of Characters   ;   -1 = Exclude  , 0 = UnLimited", 10, 15, 400)
	GUICtrlSetFont(-1, 10, 700)
	GUICtrlCreateLabel($AlphaU, 80, 40, 280, 20)
	GUICtrlSetFont(-1, 10, 800, 4)
	GUICtrlSetColor(-1, 0x008000)
	GUICtrlCreateLabel($AlphaL, 80, 70, 280, 20)
	GUICtrlSetFont(-1, 10, 800, 4)
	GUICtrlSetColor(-1, 0xDA70D6)
	GUICtrlCreateLabel($ADigits, 80, 100, 280, 20)
	GUICtrlSetFont(-1, 10, 800, 4)
	GUICtrlSetColor(-1, 0xFF0000)
	GUICtrlCreateLabel($Special, 80, 130, 280, 20)
	GUICtrlSetFont(-1, 10, 800, 2)
	GUICtrlSetColor(-1, 0xA52A2A)

	Local $n1 = GUICtrlCreateCombo("", 10, 40, 40)
	GUICtrlSetData(-1, StringLeft($cNumber, StringInStr($cNumber, "|", 0, StringLen($AlphaU) + 2) - 1), "1")

	Local $n2 = GUICtrlCreateCombo("", 10, 70, 40)
	GUICtrlSetData(-1, StringLeft($cNumber, StringInStr($cNumber, "|", 0, StringLen($AlphaL) + 2) - 1), "1")

	Local $n3 = GUICtrlCreateCombo("", 10, 100, 40)
	GUICtrlSetData(-1, StringLeft($cNumber, StringInStr($cNumber, "|", 0, StringLen($ADigits) + 2) - 1), "0")

	Local $n4 = GUICtrlCreateCombo("", 10, 130, 40)
	GUICtrlSetData(-1, StringLeft($cNumber, StringInStr($cNumber, "|", 0, StringLen($Special) + 2) - 1), "-1")

	GUICtrlCreateLabel("Excluded characters", 10, 170, 180)
	GUICtrlSetFont(-1, 10, 700)
	Local $aExclude = GUICtrlCreateInput($spattern, 10, 190, 320, 20)
;	GUICtrlSetState(-1, $GUI_DROPACCEPTED)

	GUICtrlCreateLabel("PassWord save to file", 10, 230, 280, 20)
	GUICtrlSetFont(-1, 10, 700)
	Local $i1 = GUICtrlCreateButton("Browse", 400, 250, 50)
	Local $aSaveFile = GUICtrlCreateInput("", 10, 250, 380, 20)

	GUICtrlCreateLabel("PassWord Numbers", 10, 285, 120, 20)
	GUICtrlSetFont(-1, 9, 700)
	Local $n0 = GUICtrlCreateCombo("", 140, 280, 40)
	GUICtrlSetData(-1, "4|5|6|7|8|9|10|11|12|13|14|15|16|17|18|19|20|21|22|23|24|25|26|27|28|29|30|31|32|33|34|35|36|37|38|39|40", "8")

	Local $check = GUICtrlCreateCheckbox(" Save to clipboard", 220, 280, 120, 20)
	GUICtrlSetFont(-1, 9, 700)
	GUICtrlSetState(-1, 1)

	Local $i2 = GUICtrlCreateButton("Run", 380, 280, 50)
	GUICtrlSetFont(-1, 10, 700)

	GUISetState(@SW_SHOW)

	While 1
		Local $msg = GUIGetMsg()
		Select
		Case $msg = $GUI_EVENT_CLOSE
			Exit(1)
		Case $msg = $i1
			$tVar = FileSaveDialog("Select a File", "", "(*.txt;*.*)", 18, "pw.txt")
			GUICtrlSetData($aSaveFile, $tVar)
		Case $msg = $i2
			$tFileSave = GUICtrlRead($aSaveFile)
			$toClip = GUICtrlRead($check)
			$MaxChar = GUICtrlRead($n0)
			$tAlphaU = GUICtrlRead($n1)
			$tAlphaL = GUICtrlRead($n2)
			$tADigits = GUICtrlRead($n3)
			$tSpecial = GUICtrlRead($n4)
			$spattern = GUICtrlRead($aExclude)

			GUIDelete($m0)
			ExitLoop
		EndSelect
	Wend

Else

	For $i = 1 To $CmdLine[0]
		$tCmds = $CmdLine[$i]
		$iCmd = StringUpper(StringLeft($tCmds, 2))
		Switch $iCmd
			Case 'M:'
				$MaxChar = Number(StringTrimLeft($tCmds, 2))
			Case 'U:'
				$tAlphaU = Number(StringTrimLeft($tCmds, 2))
			Case 'L:'
				$tAlphaL = Number(StringTrimLeft($tCmds, 2))
			Case 'D:'
				$tADigits = Number(StringTrimLeft($tCmds, 2))
			Case 'S:'
				$tSpecial = Number(StringTrimLeft($tCmds, 2))
			Case 'F:'
				$tFileSave = StringTrimLeft($tCmds, 2)
			Case Else
				$spattern = $tCmds
		EndSwitch
	Next
EndIf

Local $iSignal = Round(Mod(@SEC, 2) - 0.5, 0) * @SEC
Local $sJulDate = $iSignal * Round(_DateToDayValue(@YEAR, @MON, @MDAY), 0)
SRandom($sJulDate)

Local $sAlphaU = EraseCharacter($AlphaU, $spattern)
Local $sAlphaL = EraseCharacter($AlphaL, $spattern)
Local $sADigits = EraseCharacter($ADigits, $spattern)
Local $sSpecial = EraseCharacter($Special, $spattern)

If $tAlphaU > 0 Then
	$tvar = GeneratorChar($sAlphaU, $tAlphaU, True)
	$password &= $tvar
EndIf
If $tAlphaU >= 0 Then $tpasswords &= $sAlphaU

If $tAlphaL > 0 Then
	$tvar = GeneratorChar($sAlphaL, $tAlphaL, True)
	$password &= $tvar
EndIf
If $tAlphaL >= 0 Then $tpasswords &= $sAlphaL

If $tADigits > 0 Then
	$tvar = GeneratorChar($sADigits, $tADigits, True)
	$password &= $tvar
EndIf
If $tADigits >= 0 Then $tpasswords &= $sADigits

If $tSpecial > 0 Then
	$tvar = GeneratorChar($sSpecial, $tSpecial, True)
	$password &= $tvar
EndIf
If $tSpecial >= 0 Then $tpasswords &= $sSpecial

Local $yt = $MaxChar - StringLen($password)
If $yt > 0 Then $password &= GeneratorChar($tpasswords, $yt)

Local $Newpassword = GeneratorChar($password)

MsgBox(4096, "", $Newpassword)
If $toClip Then ClipPut($Newpassword)

If StringIsSpace($tFileSave) Then Exit
FileWriteLine(FileGetLongName($tFileSave, 1), $Newpassword)

Exit
;  === Main End ===


Func EraseCharacter($password, $spattern)
	If StringIsSpace($spattern) Then Return $password
	Local $tArray = StringToASCIIArray($spattern)
	For $iasc In $tArray
		$password = StringReplace($password, Chr($iasc), "", 1, 1)
	Next
	Return $password
EndFunc	;==>EraseCharacter


Func GeneratorChar(ByRef $sString, $iTimes = 0, $xCase = False)
	If $iTimes < 0 Then Return SetError(1, 0, "")
	If $iTimes = 0 Then $iTimes = StringLen($sString)
	Local $aArray = StringToASCIIArray($sString)
	Local $tArray = hArrayShuffle($aArray)
	if @error Then Return SetError(1, 0, "")
	Local $pwchar = StringFromASCIIArray($tArray, 0, $iTimes - 1)
	If $xCase Then $sString = StringFromASCIIArray($tArray, $iTimes)
	Return SetError(0, 0, $pwchar)
EndFunc	;==>GeneratorChar


Func hArrayShuffle($aArray, $iStart_Row = 0, $iEnd_Row = 0)
	If Not IsArray($aArray) Then Return SetError(1, 0, -1)
	Local $iDim_1 = UBound($aArray, $UBOUND_ROWS)
	If $iEnd_Row = 0 Then $iEnd_Row = $iDim_1 - 1
	If $iStart_Row < 0 Or $iStart_Row > $iDim_1 - 1 Then Return SetError(3, 0, -1)
	If $iEnd_Row < 1 Or $iEnd_Row > $iDim_1 - 1 Then Return SetError(3, 0, -1)
	If $iStart_Row > $iEnd_Row Then Return SetError(4, 0, -1)

	Local $vTmp, $iRand
	For $i = $iEnd_Row To $iStart_Row + 1 Step -1
		$iRand = Random($iStart_Row, $i, 1)
		$vTmp = $aArray[$i]
		$aArray[$i] = $aArray[$iRand]
		$aArray[$iRand] = $vTmp
	Next
	Return SetError(0, 0, $aArray)
EndFunc   ;==>hArrayShuffle
