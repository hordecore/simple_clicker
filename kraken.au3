Global $trigger = False
Global $counter = 0
Global $i = 0
HotKeySet("{F11}", "StartAutoSave")
HotKeySet("{F10}", "PauseAutoSave")
HotKeySet("{F9}", "Finish")


Func BuggyWalk()
   While not $trigger
	  For $i = 0 to 100 step 1
		 Send("3")
		 Sleep(100)
		 Send("2")
		 Sleep(1100)
	  Next
	  For $i = 0 to 1 step 1
		 Send("{SPACE}")
		 Send("{x}")
		 Sleep(1000)
		 WinActivate("World of Warcraft")
		 sleep(3000)
		 Send("{x}")
		 sleep(100)
		 Send("{SPACE}")
		 sleep(3000)
		 WinActivate("World of Warcraft")
		 sleep(3000)
		 Send("{x}")
		 sleep(100)
		 Send("{SPACE}")
		 Sleep(1000)
	  Next
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
