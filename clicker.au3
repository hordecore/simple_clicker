Global $trigger = False
Global $counter = 0

HotKeySet("{F11}", "StartAutoSave")
HotKeySet("{F10}", "PauseAutoSave")
HotKeySet("{F9}", "Finish")

Func StartAutoSave()
   $trigger = False
   While not $trigger
	  if $counter > 10 Then
		 $counter = 0
	  Endif
	  ; replace with your own code, I need just repeatly press "W"
	  Send("{w down}")
	  Sleep(40)
	  Send("{w up}")
	  $counter = $counter + 1
   WEnd
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
