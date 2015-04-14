Global $trigger = False
Global $counter = 0
Global $torture_speed = 1770
Global $timer
HotKeySet("{F11}", "StartAutoSave")
HotKeySet("{F10}", "PauseAutoSave")
HotKeySet("{F9}", "Finish")

Func _LOG($string)
   ConsoleWrite(String(Int(TimerDiff($timer))))
   ConsoleWrite(@TAB)
   ConsoleWrite(String($counter))
   ConsoleWrite(@TAB)
   ConsoleWrite($string & @CRLF)
EndFunc

Func Torture()
   _LOG("Torture")
   Send("2") ; Mind torture
   Sleep($torture_speed)
EndFunc

Func Plague()
   _LOG("Plague")
   Send("8")
   Sleep(50)
   Send("1") ; Plague
   Sleep(1110)
EndFunc

Func Vampiric()
   _LOG("Vampiric")
   Send("3") ; Vampiric touch
   Sleep(1110)
   _LOG("Minblast")
   Send("4") ; Mindblast
   Sleep(1110)
EndFunc

Func ManaReg()
   _LOG("ManaReg")
   _LOG("beast")
   Send("7") ; summon beast
   Sleep(200)
   Plague()
   _LOG("Toochka")
   Send("6") ; toochka
   Sleep(6005)
   _LOG("Berserk")
   Send("=") ; Berserk
   Sleep(100)
   _LOG("Pain")
   Send("5") ; Renew Possibly Faded Pain
Endfunc



Func ShadowPriestDPS()
   $timer = TimerInit()
   _LOG("Start")
   _LOG("Pain")
   Send("5") ; pain
   Sleep(1050)
   _LOG("Plauge")
   Send("1")
   While not $trigger
	  $counter = $counter + 1
	  if (Mod($counter, 8) == 0) and ($counter > 7) Then
		 Plague()
	  Endif
	  if (Mod($counter, 5) == 0) and ($counter > 4) Then
		 Vampiric()
	  Endif
	  if (Mod($counter, 50) == 1) and ($counter > 2) Then
		 ManaReg()
	  Endif
	  Torture()
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
