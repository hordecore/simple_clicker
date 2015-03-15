Global $trigger = False
Global $counter = 0
Global $torture_speed = 1740

HotKeySet("{F11}", "StartAutoSave")
HotKeySet("{F10}", "PauseAutoSave")
HotKeySet("{F9}", "Finish")

Func Plague()
   ConsoleWrite("Plague ")
   Sleep($torture_speed)
   Send("8")
   Sleep(50)б
   Send("1") ; Plague
   Sleep(1050)
   Send("2")
   Vampiric()
EndFunc

Func Vampiric()
   ConsoleWrite("Vampiric\n")
   Sleep($torture_speed)
   Send("3") ; Vampiric touch
   Sleep(1050)
   Send("4") ; Mindblast
   Sleep(1050)
   Send("2")
EndFunc

Func ManaReg()
   ConsoleWrite("ManaReg\n")
   Sleep($torture_speed)
   Send("7") ; summon beast
   Sleep(200)
   Send("1")
   Sleep(1000)
   Send("6") ; toochka
   Sleep(6005)
   Send("=") ; Berserk
   Sleep(100)
   Send("5") ; Renew Possibly Faded Pain
Endfunc

Func ShadowPriestDPS()
   Send("5") ; pain
   Sleep(1020)
   Send("1")
   $counter = 1
   While not $trigger
	  $counter = $counter + 1
	  if Mod($counter, 8) == 0 Then
		 Plague()
		 ContinueLoop
	  Endif
	  if Mod($counter, 10) == 5 Then
		 Vampiric()
		 ContinueLoop
	  Endif
	  if Mod($counter, 48) == 1 Then
		 ManaReg()
		 $counter = 1
	  Endif
	  Sleep($torture_speed)
	  Send("2") ; Mind torture
    WEnd
EndFunc

Func StartAutoSave()
   $trigger = False
   ShadowPriestDPS()
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
