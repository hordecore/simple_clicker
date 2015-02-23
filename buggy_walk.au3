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

Func StartAutoSave()
   $trigger = False
   BuggyWalk()
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
