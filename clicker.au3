Global $trigger = False
Global $counter = 0

HotKeySet("{F11}", "StartAutoSave")
HotKeySet("{F10}", "PauseAutoSave")
HotKeySet("{F9}", "Finish")

Func BuggyWalk(counter)
    While not $trigger
	  Send("{w down}")
	  Sleep(40)
	  Send("{w up}")
    WEnd
EndFunc

Func ShadowPriestDPS()
   While not $trigger
	  if $counter > 10 Then
		 $counter = 0
		 Send("1")
	  Endif
	  if $counter == 5 Then
	  	Send("3")
	  	Sleep(1200)
	  	Send("4")
	  Endif
	  Sleep(1800)
	  Send("2")
	  $counter = $counter + 1
    WEnd
EndFunc

Func StartAutoSave()
   $trigger = False
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
