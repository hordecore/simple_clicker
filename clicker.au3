Global $trigger = False
Global $counter = 0

HotKeySet("{F11}", "StartAutoSave")
HotKeySet("{F10}", "PauseAutoSave")
HotKeySet("{F9}", "Finish")

Func BuggyWalk()
    While not $trigger
	  Send("{w down}")
	  Sleep(40)
	  Send("{w up}")
    WEnd
EndFunc

Func Plague()
   ConsoleWrite("Plague")
   Sleep(1800)
   Send("1") ; Plague
   Sleep(1000)
   Send("2")
EndFunc

Func Vampiric()
   ConsoleWrite("Vampiric")
   Sleep(1800)
   Send("3") ; Vampiric touch
   Sleep(1200)
   Send("4") ; Mindblast
   Sleep(1000)
   Send("2")
EndFunc

Func ManaReg()
   ConsoleWrite("ManaReg")
   Sleep(1800)
   Send("7") ; summon beast
   Sleep(1000)
   Send("6") ; toochka
   Sleep(4800)
Endfunc

Func ShadowPriestDPS()
   Send("5") ; pain
   Sleep(1000)
   $counter = 1
   While not $trigger
	  $counter = $counter + 1
	  if Mod($counter, 10) == 0 Then
		 Plague()
		 ContinueLoop
	  Endif
	  if Mod($counter, 10) == 5 Then
		 Vampiric()
		 ContinueLoop
	  Endif
	  if Mod($counter, 65) == 1 Then
		 ManaReg()
	  Endif
	  Sleep(1800)
	  Send("2") ; Mind torture
    WEnd
EndFunc

Func StartAutoSave()
   $trigger = False
   ShadowPriestDPS()
   ; BuggyWalk()
   Return
EndFunc

Func PauseAutoSave()
   $trigger = True
EndFunc

Func Finish()
   exit(0)
EndFunc

While 1
   Sleep(100)
WEnd
