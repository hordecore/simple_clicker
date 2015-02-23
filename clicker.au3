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

Func ShadowPriestDPS()
   While not $trigger
	  if $counter % 10 == 0 Then
		 Sleep(1800)
		 Send("1") ; Plague
		 Sleep(1000)
		 Send("2")
		 ContinueLoop
	  Endif
	  if $counter % 10 == 5  Then
		 Sleep(1800)
		 Send("3") ; Vampiric touch
		 Sleep(1200)
		 Send("4") ; Mindblast
		 Sleep(1000)
		 Send("2")
		 ContinueLoop
	  Endif
	  if $counter % 65 == 0 Then
		 Sleep(1800)
		 Send("7") ; summon beast
		 Sleep(1000)
		 Send("6") ; toochka
		 Sleep(6000)
	  fi
	  Sleep(1800)
	  Send("2") ; Mind torture
	  $counter = $counter + 1
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
