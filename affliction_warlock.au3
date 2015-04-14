Global $trigger = False
Global $counter = 0
Global $bolt_speed = 1880
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

Func Porcha() ; 12 sec
   _LOG("Porcha")
   Send("5")
   Sleep(1100)
EndFunc

Func Agony() ; 24 sec
   _LOG("Agony")
   Send("1")
   Sleep(1100)
EndFunc


Func Spirit() ; 12 sec
   _LOG("Spirit")
   Send("2")
   Sleep(1130)
EndFunc

Func Unstable() ; 15 sec
   _LOG("Unstable")
   Send("3")
   Sleep(1130)
EndFunc

Func Bolt() ; 15 sec
   _LOG("Bolt")
   Send("4")
   Sleep($bolt_speed)
EndFunc

Func ManaReg()
   _LOG("manatap")
   Send("6")
   Sleep(1100)
   Send("6")
   Sleep(1100)
   Send("6")
   Sleep(1100)
Endfunc

Func AfflictionWarlockDPS()
   $timer = TimerInit()
   _LOG("Start")
   Porcha()
   Agony()
   Spirit()
   Unstable()
   Bolt()
   Manareg()
   While not $trigger
	  $counter = $counter + 1
	  if (Mod($counter, 8) == 0) and ($counter > 7) Then
		 Agony()
	  Endif
	  if (Mod($counter, 5) == 0) and ($counter > 4) Then
		 Spirit()
	  Endif
	  if (Mod($counter, 6) == 0) and ($counter > 5) Then
		 Unstable()
	  Endif
	  if (Mod($counter, 13) == 1) and ($counter > 12) Then
		 Porcha()
		 ManaReg()
	  Endif
	  Bolt()
    WEnd
EndFunc

Func StartAutoSave()
   $trigger = False
   AfflictionWarlockDPS()
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
